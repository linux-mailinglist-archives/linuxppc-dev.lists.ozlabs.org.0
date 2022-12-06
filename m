Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAB2643D73
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 08:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRBS1361gz3bgW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 18:12:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WvbnTDu9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WvbnTDu9;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRBR36wmBz2yN9
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 18:11:09 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id 62so12587016pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Dec 2022 23:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AukwF7LIIbjwToBMrJ2KcMXoGfrNr/xT77tHn252vkI=;
        b=WvbnTDu9v6O3WiI3+p2xbvgZCVhpn8hI1CBRZBsA6C8czCue6Trb5CIGwP6KAsN68E
         3s/qaSbqS0oHfYlcsNerymUE/eyrPLy4+gPgPj6hhK0E0UzJa//COgr8zs/VZRmjXS/f
         qw+zbGgQI3xeNTcyk/F8dy5UwtH8OxDcUiqqx3MpmCtnXj24Xi+VwfB84TP1Yh+InwVj
         CriplCCtdXjT14fP+1gj+uYaGR3H5/LqeLgDxSWrkozy8NufxcoedxKt2xAY7GcKvwLk
         swZ1BhuSuZ/dlXynE4GKw8zlf2R6UstlMLqk/IGhCyMc7p6MSHqIKy/+Y2WrtISTOvsw
         0XHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AukwF7LIIbjwToBMrJ2KcMXoGfrNr/xT77tHn252vkI=;
        b=U6EOGbxOHIhWFQU6rAbQ/QEDyToK47s+FpLGrzWA9uLRz3gcQ8EXq72xtCZ9ici0cG
         lNpKEuBoVlP4OQnyUAjbf2oTD9U2AhmS+725ecGoJWVXomPeCRF2M+weVGfgn9kLHaQN
         DthOUoG65QggNJWUYBWQrGGKyb1KIvB6vpLuHG6hmHR+JHZa71hdOS0t/wUcA9Z6bZpl
         qRgw+0ZlFcsNuGAjjENZ+8VP5uEwUNNcLjECRIv/6SGC5WA0GJADjkpGQ0ZnloKl3GIm
         GFlvxZuOaiemhJd1YOB7vPg4BUFStWtMr/WSVVqstbVklG322MX+a6Ux1xU+qjePmys8
         hMzA==
X-Gm-Message-State: ANoB5pmCGcBhC6qm+n6e4vPz7YS78UK47bM+B2JkdpCoXyR6YbNs6Dz7
	CFMH7cbKugLDLQYtfceTSoc=
X-Google-Smtp-Source: AA0mqf7Bi/ZCb/MofL683gT6NNjZl3DnMcdeWqG0GNM64Dmk62ubqbUl5WbP0p/0OWSmBqKxJdGQ/Q==
X-Received: by 2002:a63:5a48:0:b0:45f:88b2:1766 with SMTP id k8-20020a635a48000000b0045f88b21766mr59355779pgm.357.1670310666738;
        Mon, 05 Dec 2022 23:11:06 -0800 (PST)
Received: from localhost (27-33-250-210.static.tpgi.com.au. [27.33.250.210])
        by smtp.gmail.com with ESMTPSA id t23-20020aa79477000000b00575d6dc996bsm9366530pfq.161.2022.12.05.23.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 23:11:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Dec 2022 17:11:00 +1000
Message-Id: <COUJPOA8V93O.3EB95FEH792PM@bobo>
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christian Zigotzky" <chzigotzky@xenosoft.de>, <qemu-ppc@nongnu.org>,
 "mad skateman" <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "Christian Zigotzky" <info@xenosoft.de>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>, "Matthew Leaman" <matthew@a-eon.biz>,
 "Darren Stevens" <darren@stevens-zone.net>
X-Mailer: aerc 0.13.0
References: <fc43f9eb-a60f-5c4a-a694-83029234a9c4@xenosoft.de>
In-Reply-To: <fc43f9eb-a60f-5c4a-a694-83029234a9c4@xenosoft.de>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Dec 4, 2022 at 9:33 PM AEST, Christian Zigotzky wrote:
> Hi All,
>
> We regularly use QEMU with KVM HV on our A-EON AmigaOne X5000 machines=20
> (book3e). It works fast and without any problems.
>
> Screenshot tour of QEMU/KVM HV on our AmigaOnes:
>
> - https://i.ibb.co/m4vgwNT/Kernel-6-1-rc3-Power-PC.png
> - https://i.ibb.co/Fwdjf7Z/Kernel-6-0-rc6-Power-PC.png
> - https://i.ibb.co/LYnJGdF/Kernel-5-19-rc5-Power-PC-2.png
> - https://i.ibb.co/vz1Wm5z/QEMU-with-9p-and-USB-sound.png
> - https://i.ibb.co/ScMjtp7/Kernel-5-17-alpha5-Power-PC.png
> - https://i.ibb.co/LQryFcK/Kernel-5-17-alpha4-Power-PC.png
> - https://i.ibb.co/kKLx9mf/Kernel-5-10-89-Power-PC.png
> - https://i.ibb.co/LRG1RDV/Kernel-5-10-89-Power-PC-2.png
> - https://i.ibb.co/NCFqY0k/QEMU-USB-Audio-on-Void-PPC.png
> - https://i.ibb.co/N1vL5Kd/Kernel-5-16-alpha3-Power-PC.png
> - https://i.ibb.co/SwjTyJk/Kernel-5-16-alpha1-Power-PC.png
> - https://i.ibb.co/LkpWNPx/Kernel-5-15-rc5-Power-PC.png
> - https://i.ibb.co/F8q1jDR/Kernel-5-15-rc4-Power-PC.png
> - https://i.ibb.co/zZxrbhV/Kernel-5-15-alpha6-Power-PC.png
> -=20
> https://i.pinimg.com/originals/a8/8b/42/a88b422870201887fc01ef44ddc1a235.=
png
> -=20
> https://i.pinimg.com/originals/57/d9/83/57d98324cd055b7ae00a87ad5a45a42f.=
png
> -=20
> https://i.pinimg.com/originals/f2/a5/e3/f2a5e34e2015381b0cb87cc51232a8bc.=
png
> -=20
> https://i.pinimg.com/originals/c5/0d/85/c50d85d7e8f20b4caa1a439faf751964.=
png
> -=20
> https://i.pinimg.com/originals/6e/3b/59/6e3b59fe10276c5644b15622a81f43f1.=
png
>
> We solved some issues:
>
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D54357#p54357
> - https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-November/236307.ht=
ml
> - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/249021.h=
tml
> - https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-May/229103.html
> - https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223342.htm=
l
> - https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216379.html
> -=20
> https://forum.hyperion-entertainment.com/viewtopic.php?f=3D58&t=3D4655&p=
=3D53393&hilit=3DKVM#p53393
> - https://forum.hyperion-entertainment.com/viewtopic.php?p=3D53209#p53209
>
> Please, do not remove KVM support from Book3e because it works without=20
> any problems and fast. We need it for our work.

Hey Christian,

I knew you do a lot of testing with BookE, I didn't know you used KVM
there. Good to know it's working for you. In that case I withdraw my
question.

BookE KVM has not been too much trouble, but some things come up that
really need testing before patching, so a QEMU HV implementation would
be good to have (I mean QEMU running the host). mpe has a hardware but
probably no time$ to do much testing (especially of other peoples'
untested patches). So having that would help keep kernel support going.

Thanks,
Nick
