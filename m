Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D15B5BA38B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 02:44:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTFgs0QHLz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 10:44:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fy2hq9L8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fy2hq9L8;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTFgF2V3Yz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 10:43:35 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so18884283pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=UuKVJjo/jgQLng06BPf8rvBIeg9xul28SIsBLX+AIfM=;
        b=Fy2hq9L8L7DRY8QN6KBv2mAPCa8/1jUnaQTelXSdKSjV8KdDnlxWCi6heEify6DkN1
         6EElSHXEtGIa4BoChSwrjk05jn7EmokmZ2aKWBdCwwhWvEuSRUHaN5mdXcNhlVGhPJSN
         ZeKm8mv/ULe5X4MoJr+N5/aV5nOVp3kbJxWRBeQJUBrRBHZPvOVuyoQqUvjy2Nj67wdM
         BIgTJCF3Pi/iMFrX7mZ3wc24iehq+mNMSKNsICRmkFqL6xtRYul4XK2vQQS7wjCjTbv2
         S8GjXp/7iLKpyMZBr+JHvUStHIhOvDytaedV7IEtadm1aYJvs4U6X62ifk4/HPKBqcml
         z4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=UuKVJjo/jgQLng06BPf8rvBIeg9xul28SIsBLX+AIfM=;
        b=dWvI0LEx2P0t90XC17e9gKpcE4nPqT8shxgfn7GZ9TCkdXbLmDfJ1vrpy8DUJRjqvy
         2E8l4zPjbDR4eDgCAnPJHqQ5LpQGjC0KhaEV/+hOSnaTaWdETxrVezVYBHykdeQQt1FC
         kjblcqe/2bPCeFd2iD2pg+87+OBU15cgUIVJofih2tmGyTGoDMgC8NM8t5yNp8jyKT8c
         Zi4xRUBbF91GgTMhuINcHctHeMArSFwCmxF5FSCf68GPvxeCF4dxY4tBNavbz+XBN0K4
         zTZ8eBWOUPDUM16SkdsSidmPo+ZY5wygMQptwEAh7hNT7ZK9E6PINAckQOEkCiT94Gj0
         1NsA==
X-Gm-Message-State: ACrzQf3XqCvL0CMMN4Svmugai9R+ba4O+KPyTU+2P7xm+K8Zf77pY5JZ
	jjDwou4foJrYJYA+Ls7crJ4=
X-Google-Smtp-Source: AMsMyM7O+Wma7ynGdAfpTloDhMyQzlTHEfbjmUSkOyJ5COYuZwy1NmovsLWavj8B4ietNHHsimQn0w==
X-Received: by 2002:a17:902:bd05:b0:172:ae77:1eea with SMTP id p5-20020a170902bd0500b00172ae771eeamr2066472pls.158.1663289011946;
        Thu, 15 Sep 2022 17:43:31 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id z189-20020a6233c6000000b0054087e1aea4sm13571260pfz.15.2022.09.15.17.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 17:43:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Sep 2022 10:43:27 +1000
Message-Id: <CMXEQTG6VVGD.14Q5OOB0LQ168@bobo>
Subject: Re: [PATCH v4 19/20] powerpc/64s: Clear gprs on interrupt routine
 entry in Book3S
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-20-rmclure@linux.ibm.com>
 <CMUEYJLOTRVG.2T3T0T50LQZTS@bobo>
 <5359A37E-5094-4EBC-999A-C5CD5110D1F5@linux.ibm.com>
In-Reply-To: <5359A37E-5094-4EBC-999A-C5CD5110D1F5@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 15, 2022 at 4:55 PM AEST, Rohan McLure wrote:
>
>
> > On 12 Sep 2022, at 10:15 pm, Nicholas Piggin <npiggin@gmail.com> wrote:
> >=20
> > On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> >> Zero GPRS r0, r2-r11, r14-r31, on entry into the kernel for all
> >> other interrupt sources to limit influence of user-space values
> >> in potential speculation gadgets. The remaining gprs are overwritten b=
y
> >> entry macros to interrupt handlers, irrespective of whether or not a
> >> given handler consumes these register values.
> >>=20
> >> Prior to this commit, r14-r31 are restored on a per-interrupt basis at
> >> exit, but now they are always restored. Remove explicit REST_NVGPRS
> >> invocations as non-volatiles must now always be restored. 32-bit syste=
ms
> >> do not clear user registers on interrupt, and continue to depend on th=
e
> >> return value of interrupt_exit_user_prepare to determine whether or no=
t
> >> to restore non-volatiles.
> >>=20
> >> The mmap_bench benchmark in selftests should rapidly invoke pagefaults=
.
> >> See ~0.8% performance regression with this mitigation, but this
> >> indicates the worst-case performance due to heavier-weight interrupt
> >> handlers.
> >=20
> > Ow, my heart :(
> >=20
> > Are we not keeping a CONFIG option to rid ourselves of this vile
> > performance robbing thing? Are we getting rid of the whole
> > _TIF_RESTOREALL thing too, or does PPC32 want to keep it?
>
> I see no reason not to include a CONFIG option for this=20
> mitigation here other than simplicity. Any suggestions for a name?
> I=E2=80=99m thinking PPC64_SANITIZE_INTERRUPTS. Defaults on Book3E_64, op=
tional
> on Book3S_64.

INTERRUPT_SANITIZE_REGISTERS perhaps?

>
> >>=20
> >> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> >> ---
> >> V1 -> V2: Add benchmark data
> >> V2 -> V3: Use ZEROIZE_GPR{,S} macro renames, clarify
> >> interrupt_exit_user_prepare changes in summary.
> >> ---
> >> arch/powerpc/kernel/exceptions-64s.S | 21 ++++++++-------------
> >> arch/powerpc/kernel/interrupt_64.S   |  9 ++-------
> >> 2 files changed, 10 insertions(+), 20 deletions(-)
> >>=20
> >> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kerne=
l/exceptions-64s.S
> >> index a3b51441b039..038e42fb2182 100644
> >> --- a/arch/powerpc/kernel/exceptions-64s.S
> >> +++ b/arch/powerpc/kernel/exceptions-64s.S
> >> @@ -502,6 +502,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
> >> 	std	r10,0(r1)		/* make stack chain pointer	*/
> >> 	std	r0,GPR0(r1)		/* save r0 in stackframe	*/
> >> 	std	r10,GPR1(r1)		/* save r1 in stackframe	*/
> >> +	ZEROIZE_GPR(0)
> >>=20
> >> 	/* Mark our [H]SRRs valid for return */
> >> 	li	r10,1
> >> @@ -538,14 +539,18 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> >> 	ld	r10,IAREA+EX_R10(r13)
> >> 	std	r9,GPR9(r1)
> >> 	std	r10,GPR10(r1)
> >> +	ZEROIZE_GPRS(9, 10)
> >=20
> > You use 9/10 right afterwards, this'd have to move down to where
> > you zero r11 at least.
> >=20
> >> 	ld	r9,IAREA+EX_R11(r13)	/* move r11 - r13 to stackframe	*/
> >> 	ld	r10,IAREA+EX_R12(r13)
> >> 	ld	r11,IAREA+EX_R13(r13)
> >> 	std	r9,GPR11(r1)
> >> 	std	r10,GPR12(r1)
> >> 	std	r11,GPR13(r1)
> >> +	/* keep r12 ([H]SRR1/MSR), r13 (PACA) for interrupt routine */
> >> +	ZEROIZE_GPR(11)
> >=20
> > Kernel always has to keep r13 so no need to comment that. Keeping r11,
> > is that for those annoying fp_unavailable etc handlers?
> >=20
> > There's probably not much a user can do with this, given they're set
> > from the MSR. Use can influence some bits of its MSR though. So long
> > as we're being paranoid, you could add an IOPTION to retain r11 only fo=
r
> > the handlers that need it, or have them load it from MSR and zero it
> > here.
>
> Good suggestion. Presume you=E2=80=99re referring to r12 here. I might go=
 the
> IOPTION route.

Yeah r12, I think you need it because some of those assembly handlers
expect it there to check SRR1 bits. Having an IOPTION is probably good
and it documents that quirk of those handlers. That's bitten me before.

Thanks,
Nick
