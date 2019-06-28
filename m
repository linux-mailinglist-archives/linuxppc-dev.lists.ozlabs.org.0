Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 972D259245
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 06:05:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZjpX5P17zDqm6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 14:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=jsavitz@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZhKt3pzpzDqbv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:58:38 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B92A8356D4;
 Fri, 28 Jun 2019 02:58:33 +0000 (UTC)
Received: from jsavitz.bos.com (ovpn-123-72.rdu2.redhat.com [10.10.123.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B46BC60BE0;
 Fri, 28 Jun 2019 02:58:29 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rpaphp: Avoid a sometimes-uninitialized warning
Date: Thu, 27 Jun 2019 22:57:54 -0400
Message-Id: <1561690674-5880-1-git-send-email-jsavitz@redhat.com>
In-Reply-To: <20190603221157.58502-1-natechancellor@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 02:58:36 +0000 (UTC)
X-Mailman-Approved-At: Fri, 28 Jun 2019 14:03:42 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-pci@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>On Mon, Jun 03, 2019 at 03:11:58PM -0700, Nathan Chancellor wrote:
>> When building with -Wsometimes-uninitialized, clang warns:
>> 
>> drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
>> used uninitialized whenever 'for' loop exits because its condition is
>> false [-Wsometimes-uninitialized]
>>         for (j = 0; j < entries; j++) {
>>                     ^~~~~~~~~~~
>> drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
>> here
>>         if (fndit)
>>             ^~~~~
>> drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
>> it is always true
>>         for (j = 0; j < entries; j++) {
>>                     ^~~~~~~~~~~
>> drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
>> 'fndit' to silence this warning
>>         int j, fndit;
>>                     ^
>>                      = 0
>> 
>> fndit is only used to gate a sprintf call, which can be moved into the
>> loop to simplify the code and eliminate the local variable, which will
>> fix this warning.
>> 
>> Link: https://github.com/ClangBuiltLinux/linux/issues/504
>> Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
>> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> ---
>> 
>> v1 -> v2:
>> 
>> * Eliminate fndit altogether by shuffling the sprintf call into the for
>>   loop and changing the if conditional, as suggested by Nick.
> 
>>  drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
>>  1 file changed, 7 insertions(+), 11 deletions(-)

>> Gentle ping, can someone pick this up?

Looks a good simplification of somewhat convoluted control flow.

Acked-by: Joel Savitz <jsavitz@redhat.com>
