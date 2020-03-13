Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90688184520
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 11:45:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f2QW2MhczDqVB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 21:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f2Nk4CfHzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 21:43:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=e3GcwYox; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48f2Nj1nkdz9sQx;
 Fri, 13 Mar 2020 21:43:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584096214;
 bh=48BTPpdnvH7ubHf8Mn96zZTm64oFJUSebhf5Q/n0y2U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=e3GcwYoxeeUUmg4GpRStDdvnzxQK+ciVsY7yqakH7GrxIraMabyMbhFZ9i1cyXFAJ
 LQDeCWoPVvrQNUHqhoXMPmMEzQfS43lfBi3L26viv/f/xBCNtfEvZ0l+pALgV6hO5U
 OsQNJZFWHXu6j67mhmgisj+rTFIaO21BK5Yc+gWmxCN2qK+It5nqaYbxkfI/mHkxVP
 gFc1sUcHR3KYm97tm6aNARINaJvUBjWmYTetktYEDCkh+q0eYWbQcNiWLQP220T/1B
 faNwPRaJSDAjgifYpLSpCOzdBge9Zz917p3aKmffsrbmZ3IfLN+GyDqwmp0AONgJxZ
 W48hm3c3qjeAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next] PCI: rpaphp: remove set but not used variable
 'value'
In-Reply-To: <20200312144157.GA110750@google.com>
References: <20200312144157.GA110750@google.com>
Date: Fri, 13 Mar 2020 21:43:29 +1100
Message-ID: <877dzoy1pq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: tyreld@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Thu, Mar 12, 2020 at 09:38:02AM -0500, Bjorn Helgaas wrote:
>> On Thu, Mar 12, 2020 at 10:04:12PM +0800, Chen Zhou wrote:
>> > Fixes gcc '-Wunused-but-set-variable' warning:
>> > 
>> > drivers/pci/hotplug/rpaphp_core.c: In function is_php_type:
>> > drivers/pci/hotplug/rpaphp_core.c:291:16: warning:
>> > 	variable value set but not used [-Wunused-but-set-variable]
>> > 
>> > Reported-by: Hulk Robot <hulkci@huawei.com>
>> > Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> 
>> Michael, if you want this:
>> 
>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>> 
>> If you don't mind, edit the subject to follow the convention, e.g.,
>> 
>>   PCI: rpaphp: Remove unused variable 'value'
>> 
>> Apparently simple_strtoul() is deprecated and we're supposed to use
>> kstrtoul() instead.  Looks like kstrtoul() might simplify the code a
>> little, too, e.g.,
>> 
>>   if (kstrtoul(drc_type, 0, &value) == 0)
>>     return 1;
>> 
>>   return 0;
>
> I guess there are several other uses of simple_strtoul() in this file.
> Not sure if it's worth changing them all, just this one, or just the
> patch below as-is.

I'll take this patch as-is, and someone can send a follow-up to convert
the whole file to kstrtoul().

cheers
