Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF4B36A1A1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 16:37:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FSDK861k9z30F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Apr 2021 00:37:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R5+47fg2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R5+47fg2; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FSDJk3KyZz2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Apr 2021 00:37:23 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id a5so21879354ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uoH4H/qXa4Hgq9FClpPx5Dd1jyM5vAg3STeuwuUsMrM=;
 b=R5+47fg2JRT8b1JFcau5QKkKNNrVbDJ9eorTWPmron02FSe1B6uz22b6WJRS9xk6vy
 ryaJvb91zrghAXcsNyFmSj1Mmd/AaOcrw57gha4nL2MwH3QSVcqKfLYPHSINGRQE2W8W
 KWPAKE2+bZ+SrCZntoEYkx75yT1cjKasMn864wU8PMP9dO6PIFPShZZvb8vyinC5FHkW
 SfVq0+e3yKpyOEGHJ5nrqexpIHEHRusjtC5QFbkq9NMLl1ZZzSbJ8wypyZ98W2Gj8np/
 nKxvwBho8zISh+gR9kkNhnwxtuC7DFcRa2w0wqEhu4bFVcMcBYSAfwEYa+4+Wp7naA0i
 UjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uoH4H/qXa4Hgq9FClpPx5Dd1jyM5vAg3STeuwuUsMrM=;
 b=quJ0TsIh9bNp6cQfWRBTyYQRJ0fsuM0QnhlJZ+kjQni1PUB+7bQYZ6hvuOrJ7zbRO0
 Ro71DikBqNZY4JcYCTqygS32nnnAq/YRCcdrDzXra/7k0/viTIHiCbD7uoyyLUhPCswn
 kzXXLP2QF4H57BlKmefZt6IwJ7Hno+1Zt7wnNpQHMeqsPAeYJl5EZ0ndG2SlFTanQ2v4
 v3fEOslvOCvrgWQzixknii7ak+SagjHUYhLEo9F7Vz/TLUnatGacPrMkelv6kSj13e4c
 W9S+UgrWoUuQmeCZpVYruaM8xBRN1DAhWyFHA25VZJuz/PVpKdA4nSJAkl7pTaqk5h06
 VoJg==
X-Gm-Message-State: AOAM532lY49bZmzDm6BVChe/oXaR7VKDBs3+xgSNpqVI/+MJ6Ta5rFcy
 WBWumqoThRWkeC0WKwnNtOCQMdXMy5XR5LdtvOY=
X-Google-Smtp-Source: ABdhPJySHRSJNlYs06zs6c5IJXEasLWi9mJck6gduE1wPps9RrO4Ua2TDbKsgpqrqeqnccCSersGmdTwtjCdUgHzV6o=
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr6138999lja.297.1619275039634; 
 Sat, 24 Apr 2021 07:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210422151022.17868-1-sxwjean@me.com>
 <15aac264-8626-ad15-7301-044c622d7f60@csgroup.eu>
In-Reply-To: <15aac264-8626-ad15-7301-044c622d7f60@csgroup.eu>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Sat, 24 Apr 2021 22:36:53 +0800
Message-ID: <CAEVVKH8K84=DuQy370eVv4kx24nHiOqnputtERLuGoc4-MwYtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: Make the code in __show_regs nice-looking
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 Xiongwei Song <sxwjean@me.com>, 0x7f454c46@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, aneesh.kumar@linux.ibm.com,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 11:27 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/04/2021 =C3=A0 17:10, Xiongwei Song a =C3=A9crit :
> > From: Xiongwei Song <sxwjean@gmail.com>
> >
> > Create a new function named interrupt_detail_printable to judge which
> > interrupts can print esr/dsisr register.
>
> What is the benefit of that function ? It may be interesting if the test =
was done at several places,
> but as it is done at only one place, I don't thing it is an improvement.
>
> Until know, you new immediately what was the traps that would print it. N=
ow you have to go and look
> into a sub-function.

How about replace if statement with switch statement directly, like
the changes below:

@@ -1467,13 +1481,17 @@ static void __show_regs(struct pt_regs *regs)
        trap =3D TRAP(regs);
        if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
                pr_cont("CFAR: "REG" ", regs->orig_gpr3);
-       if (trap =3D=3D INTERRUPT_MACHINE_CHECK ||
-           trap =3D=3D INTERRUPT_DATA_STORAGE ||
-           trap =3D=3D INTERRUPT_ALIGNMENT) {
+       switch(trap){
+       case INTERRUPT_MACHINE_CHECK:
+       case INTERRUPT_DATA_STORAGE:
+       case INTERRUPT_ALIGNMENT:
                if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
                        pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar,
regs->dsisr);
                else
                        pr_cont("DAR: "REG" DSISR: %08lx ", regs->dar,
regs->dsisr);
+               break;
+       default:
+               break;
        }

Thanks,
Xiongwei
