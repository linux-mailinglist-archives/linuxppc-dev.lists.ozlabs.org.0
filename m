Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4250AAA5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 19:48:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PSpv5W1ZzDr2g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 03:48:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PSmh4Jg3zDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 03:46:42 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B85EEAC18;
 Thu,  5 Sep 2019 17:46:38 +0000 (UTC)
Date: Thu, 5 Sep 2019 19:46:38 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3] powerpc/64: system call implement the bulk of the
 logic in C
Message-ID: <20190905194638.74ab317d@kitsune.suse.cz>
In-Reply-To: <1b0c7814-786e-f453-a26b-9d1cf7df12ce@c-s.fr>
References: <20190905123512.24311-1-npiggin@gmail.com>
 <1b0c7814-786e-f453-a26b-9d1cf7df12ce@c-s.fr>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Sep 2019 15:25:31 +0000
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> On 09/05/2019 12:35 PM, Nicholas Piggin wrote:
> > System call entry and particularly exit code is beyond the limit of what
> > is reasonable to implement in asm.
> > 
> > This conversion moves all conditional branches out of the asm code,
> > except for the case that all GPRs should be restored at exit.
> > 
> > Null syscall test is about 5% faster after this patch, because the exit
> > work is handled under local_irq_disable, and the hard mask and pending
> > interrupt replay is handled after that, which avoids games with MSR.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>  
> 
> Cannot apply it on latest powerpc/merge. On what does that apply ?

The v2 series had 4 patches so presumably the previous 3 are missing
here.

Thanks

Michal
