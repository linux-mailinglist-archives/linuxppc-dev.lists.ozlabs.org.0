Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED3D648966
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 21:13:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTMfB1t2Xz3bgH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 07:13:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RqtUEPxN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=kai.vehmanen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RqtUEPxN;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT8Z36qsXz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 22:54:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670586844; x=1702122844;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i6l99AsOk7Ek/fC/JJlzKRTZl8kQmivMJCaJu9pD6WY=;
  b=RqtUEPxNPW0mUUEpWWcgAOnRpzup4gXAobGCZpjDqJPU+IPtOnZfBl9G
   Dre+nHifFPCjNcFC5zvmKiOFxLPCT2HC+HZ3jO1x7QQOW7Z0W7NfvKtDD
   a/JN+hVt00FevEw+k2kY1015GBBsZ3uieIApa4RxeUDK2rVBrCvdX7y7/
   4Lj/L9PDr1VO1eSJTvxeMLZUnSyLMXHox3EtKmGJBzM42ZzIkbidW781F
   PXUmPeMlQPNOcPcBuyhFvkHaswEsj3I5ZQYi3UgnIZhyhfwB0SlV+x80u
   Cp/0cwpb1p/k1LFHmTbVTETE3T86Km0PrjUWyriF7VplQEXOs8QngFLlw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="305085948"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="305085948"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 03:53:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="736191278"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="736191278"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 03:53:50 -0800
Date: Fri, 9 Dec 2022 13:53:31 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
In-Reply-To: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2212091349310.3532114@eliteleevi.tm.intel.com>
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org> <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org> <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com> <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
 <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com> <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Sat, 10 Dec 2022 07:12:35 +1100
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Alsa-devel <alsa-devel@alsa-project.org>, x86@kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-hyperv@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-efi@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, sound-open-firmware@alsa-project.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, Takashi Iwai <tiwai@suse.com>, Dexuan Cui <decui@microsoft.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Chromeos Kdump <chromeos-kdump@google.com>, xen-devel@lists.xenproject.org, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>, Mark Brown 
 <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Oliver Neukum <oneukum@suse.com>, kexec@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Eric Biederman <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, 1 Dec 2022, Ricardo Ribalda wrote:

> On Thu, 1 Dec 2022 at 14:22, 'Oliver Neukum' via Chromeos Kdump <chromeos-kdump@google.com> wrote:
> >
> > On 01.12.22 14:03, Ricardo Ribalda wrote:
> > > This patchset does not modify this behaviour. It simply fixes the
> > > stall for kexec().
> > >
> > > The  patch that introduced the stall:
> > > 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
> > > in .shutdown")
> >
> > That patch is problematic. I would go as far as saying that
> > it needs to be reverted.
> 
> It fixes a real issue. We have not had any complaints until we tried
> to kexec in the platform.
> I wont recommend reverting it until we have an alternative implementation.
> 
> kexec is far less common than suspend/reboot.

I've posted an alternative to ALSA list that reverts the problematic
patch and fixes the problem (the patch was originally addressing)
in a different way:

https://mailman.alsa-project.org/pipermail/alsa-devel/2022-December/209776.html

No changes outside sound/soc/ are needed with this approach.

Br, Kai
