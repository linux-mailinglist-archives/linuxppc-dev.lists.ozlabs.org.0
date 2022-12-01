Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667363F6E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 18:53:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNNwY0kgzz3fL1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 04:53:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Sxbi0cvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Sxbi0cvS;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNGd84ZjNz3bWk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 00:09:47 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id s7so1601555plk.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
        b=Sxbi0cvSliG9a00Ry4hRL3209ix85X2kIBcjhC5k1nEv5BOdHhFeI7Ixds0JdL6dZ6
         7K72xHH++bcFQ6L4GeTVOnVIGmY3VxFsiE1PwDgAbEFd1Qg/8JsKJA/ZZABySB5cfN5I
         rXB/aOLFPlnEkVyBmH4j/VAB0BH/L38J6evN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
        b=MyXGMZxVpMULsCU8G7z6ZgMzUY7edciskhHr15nE26wFc1lGwteQSx6kWFjmaGBXZX
         8B7Vp1+4qgHvq3rVUE+nGKJirOUwH9hUlkkRrU0re0gBVM3O7NFymyUBCfPu3tIZ9Y45
         XZK1LW37Mi+CvBShsGJ7vcJd7Vx0dfjqiywjA9fZxiOs5Vv3lLUks0bZddz9kt22kmRt
         qYVQqvfQ2KYppyxx6A/7EQPXo4Z1k7px+p6RLXIz/0SoDzm6EBKVPqcgt3aGRQoE1MYE
         yku+ZZpCdDP2NjZ6HEq4QBVe8LTFtaxCH/6NvMVVbrYWcdAcUuvX+p10/gJx9Uwa405R
         HwMQ==
X-Gm-Message-State: ANoB5pkj5yRHyFEorZ90YEnWp4JAZBTAI6n/Und31zA5D0vhv9tdOoyX
	Ix9rYcshlzy66VOTXbEIrAgz0GX9LTYI9kky
X-Google-Smtp-Source: AA0mqf7ncDdQu8EeVSVsLMU1DzaouhejB2ymBG/63uoT9TMu0qBJ5My4tBN5/0W2zitWE1GxNTecBw==
X-Received: by 2002:a17:90b:3444:b0:214:e1:cabe with SMTP id lj4-20020a17090b344400b0021400e1cabemr48520529pjb.153.1669900182080;
        Thu, 01 Dec 2022 05:09:42 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d1-20020a170903230100b0018911ae9dfasm3599024plh.232.2022.12.01.05.09.41
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 05:09:41 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id 140so1815154pfz.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Dec 2022 05:09:41 -0800 (PST)
X-Received: by 2002:a05:6e02:66d:b0:303:1196:96c7 with SMTP id
 l13-20020a056e02066d00b00303119696c7mr9848943ilt.133.1669899845427; Thu, 01
 Dec 2022 05:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org> <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
In-Reply-To: <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 1 Dec 2022 14:03:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
To: Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 02 Dec 2022 04:43:21 +1100
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org, x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-efi@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, sound-open-firmware@alsa-project.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, Takashi Iwai <tiwai@suse.com>, Dexuan Cui <decui@microsoft.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Chromeos Kdump <chromeos-kdump@google.com>, xen-devel@lists.xenproject.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@ker
 nel.org>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kexec@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Eric Biederman <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Oliver

Thanks for your review

On Thu, 1 Dec 2022 at 13:29, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 01.12.22 12:08, Ricardo Ribalda wrote:
> > If we are shutting down due to kexec and the userspace is frozen, the
> > system will stall forever waiting for userspace to complete.
> >
> > Do not wait for the clients to complete in that case.
>
> Hi,
>
> I am afraid I have to state that this approach is bad in every case,
> not just this corner case. It basically means that user space can stall
> the kernel for an arbitrary amount of time. And we cannot have that.
>
>         Regards
>                 Oliver

This patchset does not modify this behaviour. It simply fixes the
stall for kexec().

The  patch that introduced the stall:
83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
in .shutdown")

was sent as a generalised version of:
https://github.com/thesofproject/linux/pull/3388

AFAIK, we would need a similar patch for every single board.... which
I am not sure it is doable in a reasonable timeframe.

On the meantime this seems like a decent compromises. Yes, a
miss-behaving userspace can still stall during suspend, but that was
not introduced in this patch.

Regards!
>


-- 
Ricardo Ribalda
