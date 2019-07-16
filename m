Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7156A1EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 07:49:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nqGZ46TWzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 15:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="IAZ5ATdH"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nqCj5LfgzDqSJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 15:46:54 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id d17so18236265qtj.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 22:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pXzt/Xt5icpgfdgWe8fx1SA3//IrbfSH75zVvRGoHxE=;
 b=IAZ5ATdHDeFhZ1LT5jGMAAhWLnrHRy56pYKmoECZSOx3wlqrb4vOrhTDQk93vt8ltE
 lOLd9wjLugRUJtDnxbVr6+btR0DPIjP2Z7Xs4SRVG7cVB6kDofg6xJ7aBH0yiGLjtJK7
 spM/Dq3cBIBeJdX/LsOetZf8sjNJHwmq3VKuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pXzt/Xt5icpgfdgWe8fx1SA3//IrbfSH75zVvRGoHxE=;
 b=mPj/SRdIbwKP/8EjTtG8OX1jyNc63udmoyhj2Ce+N/eUUFeM5fWxLDnkhJqIJDnlH4
 KHpBrt4CogteFMek3pVF04an2GrwmiRwgI4PBzxb89l3N3qeF9knFky6IPYQJpnuCdRr
 UNPkbn4XrvDILaVZxwszx0/r2MzZ06Mg+Nmo2ZvVe+YAb0m7ab2urqxuoGz4FGnYTVN+
 6NEhQrXrXLNBcMvu/AiAMB8QPzCQh/epOqPQOxDRrHA/KFBMVa3mab1SfFLnTyLDe2XI
 0XF1yslfPOu5tmRTbNZI5ZvMBgFu4Y4Z1JjbdMa+OM+DTgjQhltOnne3ajVwc4QP928P
 c/LQ==
X-Gm-Message-State: APjAAAVusueZF9VP6Xtug0WDTp2XYt+SpvG4Gybstnc1PB+LENVZ2JUz
 9QTaFY9jOZliOypH+4E1I73AmoW7xYVerPIYaHI=
X-Google-Smtp-Source: APXvYqz3qOuqu+sVGSDL9uihAeRKdDRPGS/kXQXEQsmWgjgnOnG9u5/n2XLRhMQrZ0wfvHv3AfNs1hHqkGy+jHxKTV0=
X-Received: by 2002:a05:6214:1306:: with SMTP id
 a6mr22757300qvv.38.1563256011165; 
 Mon, 15 Jul 2019 22:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190716025400.4475-1-jniethe5@gmail.com>
In-Reply-To: <20190716025400.4475-1-jniethe5@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Jul 2019 05:46:39 +0000
Message-ID: <CACPK8Xet3sX-JbfAN2vAdOzvSkHXG+qEH+B6+9f26-2r+vgY3Q@mail.gmail.com>
Subject: Re: [PATCH] PPC: Set reserved PCR bits
To: Jordan Niethe <jniethe5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jul 2019 at 02:55, Jordan Niethe <jniethe5@gmail.com> wrote:
>
> Currently the reserved bits of the Processor Compatibility Register
> (PCR) are cleared as per the Programming Note in Section 1.3.3 of the
> ISA.  An update is planned for the ISA so that PCR reserved bits should
> be set. Set the reserved bits of the PCR as required.
>
> Acked-by: Alistair Popple <alistair@popple.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Tested-by: Joel Stanley <joel@jms.id.au>

I gave a powernv_defconfig build a spin in a qemu powernv machine.

Cheers,

Joel
