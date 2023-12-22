Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8E81C7AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 10:56:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VU3RwpRH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxN4B6kRLz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 20:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VU3RwpRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxN3P5T5Bz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 20:56:01 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3e6c86868so13783725ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 01:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703238959; x=1703843759; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OLFd2ztkNVgmb3arj+SalK3eRAnUUPZiYspaCp+2ZI=;
        b=VU3RwpRHEHHlg3lJyzHdveCBCf74nGAT/hQMS53hV0Qy5leYW5gV/aeoHeGLtYdAVM
         AZSiCWVstz8DG0n696wQ4R1ogCXg1GOeoe82UcrA3I2CDRRsO6QmO2/cMQGBxcQC6a3f
         ZtrrPrKUHzj3NDP9CZNS9FsUdKcaHL6Dhrt6bZHMe2FGe2JKYwdlU6a5mAzod7GuIW86
         ini2+q63ASWHiPUMvnT7IXc5yISXu2hy6BoGI7IuDRa+AqOeKbKlmrwUF9A33czNqsLr
         /Vwz8UgILsg5EbLqY7TH0E5fwJOd0qySZFMJ/Y9IoQh71YWCRzKarktzHWRGHpAIZzB3
         nW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703238959; x=1703843759;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OLFd2ztkNVgmb3arj+SalK3eRAnUUPZiYspaCp+2ZI=;
        b=mmNvvA+VT02kp31f3ndI7t8gssI9UtC03qQl2FarigWkxVi432RNBN02CnNynjO5Ao
         TadH7VTKk7ZQWOeFYscxY5Vg3ca6a00zZ+TUDRIyYexNeTuuQcvo9uguc6X429QswEM5
         rIHDON2Nqlkaa0wCOL95YFjteej5DBYmb2wJkGbRd4Z+OJOHO1EVZGS9Te67j5wEsMbN
         3PDZUVt2D8hjmdiCGuYJmqDp7ElAxQU5pfn0uHcaXhnarRcRf4LTeYaArFPMoi46uXXR
         RapP/sD70522EX5K2nHdjipan6WUAT/tIB+7627UN+pLCu2L81kET5X7dHReCOE+lQRj
         1QEA==
X-Gm-Message-State: AOJu0Ywvh9YZyrdzFVdIDcbBeKSAyO6HiZcP7tFUj6ocdeLqYT6HgBp4
	brrgx25SQ1z2pMehqD0IXlVBlMUUsCg=
X-Google-Smtp-Source: AGHT+IHGXJeA4Z9CHTuglBHWWMDbE1zDQFmX5Q6sHzAuyhKWSEdBaEczbg674wDAG3DdC6OjcLGP3Q==
X-Received: by 2002:a17:902:db02:b0:1d3:bc96:6c13 with SMTP id m2-20020a170902db0200b001d3bc966c13mr1173424plx.35.1703238958957;
        Fri, 22 Dec 2023 01:55:58 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id be10-20020a170902aa0a00b001d3c3d486bfsm3036465plb.163.2023.12.22.01.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 01:55:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 19:55:53 +1000
Message-Id: <CXURTH5YQKXS.36M3EIM30WDMC@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 18/29] powerpc: Fix stack backtrace
 termination
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-19-npiggin@gmail.com>
 <464fccfc-b375-4458-b718-de606e50c61c@redhat.com>
In-Reply-To: <464fccfc-b375-4458-b718-de606e50c61c@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 10:22 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > The backtrace handler terminates when it sees a NULL caller address,
> > but the powerpc stack setup does not keep such a NULL caller frame
> > at the start of the stack.
> >=20
> > This happens to work on pseries because the memory at 0 is mapped and
> > it contains 0 at the location of the return address pointer if it
> > were a stack frame. But this is fragile, and does not work with powernv
> > where address 0 contains firmware instructions.
> >=20
> > Use the existing dummy frame on stack as the NULL caller, and create a
> > new frame on stack for the entry code.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/cstart64.S | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> > index e18ae9a2..14ab0c6c 100644
> > --- a/powerpc/cstart64.S
> > +++ b/powerpc/cstart64.S
> > @@ -46,8 +46,16 @@ start:
> >   	add	r1, r1, r31
> >   	add	r2, r2, r31
> >  =20
> > +	/* Zero backpointers in initial stack frame so backtrace() stops */
> > +	li	r0,0
> > +	std	r0,0(r1)
> > +	std	r0,16(r1)
> > +
> > +	/* Create entry frame */
> > +	stdu	r1,-INT_FRAME_SIZE(r1)
>
> Shouldn't that rather be STACK_FRAME_OVERHEAD instead of INT_FRAME_SIZE..=
.
>
> >   	/* save DTB pointer */
> > -	std	r3, 56(r1)
> > +	SAVE_GPR(3,r1)
>
> ... since SAVE_GPR uses STACK_FRAME_OVERHEAD (via GPR0), too?

No I think it's correct. INT_FRAME_SIZE has STACK_FRAME_OVERHEAD and
struct pt_regs. The STACK_FRAME_OVERHEAD in GPR offsets is just to skip
that and get to pt_regs.gpr[].

Thanks,
Nick
