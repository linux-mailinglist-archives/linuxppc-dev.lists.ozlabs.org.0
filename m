Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195CF823720
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 22:29:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=gmfJ8QpW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PROaPpe2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T52sm5qy2z3byh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 08:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=gmfJ8QpW;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=PROaPpe2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::102; helo=mout-p-102.mailbox.org; envelope-from=torvic9@mailbox.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 317 seconds by postgrey-1.37 at boromir; Wed, 03 Jan 2024 20:39:21 AEDT
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050:0:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4l6d4WcLz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 20:39:21 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4T4l0J2lMGz9tF9;
	Wed,  3 Jan 2024 10:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704274432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRUNuY4twZgDFCA5VbnSEJ3nMmDqW3XaOjy/vo3VxTE=;
	b=gmfJ8QpWwkRfC9P9BsjFu2Ox5QDn3kWmOHdS0KTNIalzZ/EFQ9qoe7e7OH8ne8dPssqA9E
	gtRBo4BnUuXsDbW3iP5sziEu7HpDTCYtH8IRM1L5DbTIESxw6zanottpNJXw1GISgw1/dD
	mwP3s2tb1eWv+NElbZ5kKn5xTwiodIq3c/D6WwJKQfbxGGtukTkw+fUTeCcow7jiBakx6p
	MRiJyg8SeyczAjlyC3dU84bM1jt8lU94J6yAsTkOvpsXkT2SROTLCRYD2go+x+kHIAxyUs
	UkIhWU3AIw4uo++gWoeiAcynweYRVomEiWu8bD1KofqNp0LD1LTFuBLvDl9Kzw==
Message-ID: <8cdba1ac-701f-40d4-ade9-e429da4a0794@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1704274430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRUNuY4twZgDFCA5VbnSEJ3nMmDqW3XaOjy/vo3VxTE=;
	b=PROaPpe2Y1vRkl7v9VKf4xLdhI4w4dZPcVJ8w4RxCVzKqoYh3UlqZ6a/ypyaCdRxG8zvBT
	KJsgVU4xW6yt5XHZ/yOduq601SvTNW1N6hU0GbBlZImYXDSNRSwMrh4ThUSVx+fiv1gKdn
	wv6cSLmudJUHN4yz9+gbE4gPIDWrFbOQgRL94AOfpzfl3ueCzXV/nr9Dw5whBtXOTFw4a3
	9AgcN792Xw/9w+58nfzmPrfbaWRfhlpqyO6h5vPb7/IwAsp6Ls+umfQvT0XbQsIwiGCDgq
	mPPDsP6ByZsH7B1zpSdtPQiKUUbMX0mUHHl+lW+htDCR292BcrGBk7AWybkKmQ==
Date: Wed, 3 Jan 2024 10:33:42 +0100
MIME-Version: 1.0
Subject: Re: WARNING: No atomic I2C transfer handler for 'i2c-4' at
 drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x178/0x190 (kernel 6.6.X, 6.7-rcX,
 PowerMac G5 11,2)
To: Erhard Furtner <erhard_f@mailbox.org>, linux-i2c@vger.kernel.org
References: <20231222230106.73f030a5@yea>
Content-Language: en-US
From: Tor Vic <torvic9@mailbox.org>
In-Reply-To: <20231222230106.73f030a5@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b01b190b218eed6ac16
X-MBO-RS-META: 76hzqx1k5odjfgyy6ufb1dyga4kiaiym
X-Rspamd-Queue-Id: 4T4l0J2lMGz9tF9
X-Mailman-Approved-At: Thu, 04 Jan 2024 08:28:33 +1100
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
Cc: mwalle@kernel.org, linuxppc-dev@lists.ozlabs.org, benjamin.bara@skidata.com, Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/22/23 23:01, Erhard Furtner wrote:
> Greetings!
> 
> I am getting this on my PowerMac G5 11,2 at reboot on kernels 6.6.X and 6.7-rcX:
> 

Hi,

this seems to be the same issue as [1], and also referenced in [2].

For now, I have reverted the patch [3] as the huge splats on reboot are 
really annoying.

[1] 
https://lore.kernel.org/linux-i2c/13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org/

[2] 
https://lore.kernel.org/linux-i2c/20230327-tegra-pmic-reboot-v7-2-18699d5dcd76@skidata.com/T/#m22d00b913f150b4d80623162c5b0c79b338774f0

[3] (3473cf43b) i2c: core: Run atomic i2c xfer when !preemptible

Cheers,
Tor Vic

> [...]
> reboot: Restarting system
> ------------[ cut here ]------------
> No atomic I2C transfer handler for 'i2c-4'
> WARNING: CPU: 1 PID: 362 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x178/0x190
> Modules linked in: windfarm_cpufreq_clamp windfarm_smu_sensors windfarm_smu_controls windfarm_pm112 snd_aoa_codec_onyx windfarm_pid snd_aoa_fabric_layout snd_aoa nouveau windfarm_smu_sat snd_aoa_i2sbus windfarm_lm75_sensor snd_aoa_soundbus windfarm_max6690_sensor firewire_ohci snd_pcm windfarm_core drm_exec snd_timer firewire_core crc_itu_t gpu_sched snd i2c_algo_bit backlight drm_ttm_helper ttm soundcore ohci_pci rack_meter tg3 drm_display_helper hwmon cfg80211 rfkill zram zsmalloc loop dm_mod configfs
> CPU: 1 PID: 362 Comm: kwindfarm Not tainted 6.6.7-gentoo-PMacG5 #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c000000000b03f68 LR: c000000000b03f64 CTR: 0000000000000000
> REGS: c00000001fddf930 TRAP: 0700   Not tainted  (6.6.7-gentoo-PMacG5)
> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24002842  XER: 00000000
> IRQMASK: 0
> GPR00: 0000000000000000 c00000001fddfbd0 c0000000010dd900 0000000000000000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c00000000ffff700 c000000000101558 c00000001be361c0
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 0000000000000000 0000000000000000 c0003d0000348258
> GPR24: 0000000051eb851f 000000000000004c 0000000000000000 0000000000000001
> GPR28: 0000000000000001 0000000000000002 c00000001fddfc96 c0000000040c8828
> NIP [c000000000b03f68] i2c_smbus_xfer+0x178/0x190
> LR [c000000000b03f64] i2c_smbus_xfer+0x174/0x190
> Call Trace:
> [c00000001fddfbd0] [c000000000b03f64] i2c_smbus_xfer+0x174/0x190 (unreliable)
> [c00000001fddfc70] [c000000000b040d4] i2c_smbus_read_byte_data+0x64/0xd0
> [c00000001fddfcd0] [c0003d00003290c8] wf_max6690_get+0x30/0x90 [windfarm_max6690_sensor]
> [c00000001fddfd00] [c0003d000006878c] pm112_wf_notify+0x564/0x118c [windfarm_pm112]
> [c00000001fddfe00] [c000000000103364] notifier_call_chain+0xa4/0x190
> [c00000001fddfea0] [c00000000010387c] blocking_notifier_call_chain+0x5c/0xb0
> [c00000001fddfee0] [c0003d000034ebe0] wf_thread_func+0xe8/0x190 [windfarm_core]
> [c00000001fddff90] [c000000000101680] kthread+0x130/0x140
> [c00000001fddffe0] [c00000000000bfb0] start_kernel_thread+0x14/0x18
> Code: 39800000 4e800020 e9290018 2c290000 4082ff1c e88300e0 2c240000 4182001c 3c62fff4 3863f2b0 4b5bf379 60000000 <0fe00000> 4bfffef8 e8830090 4bffffe4
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> No atomic I2C transfer handler for 'i2c-4'
> WARNING: CPU: 1 PID: 362 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x178/0x190
> Modules linked in: windfarm_cpufreq_clamp windfarm_smu_sensors windfarm_smu_controls windfarm_pm112 snd_aoa_codec_onyx windfarm_pid snd_aoa_fabric_layout snd_aoa nouveau windfarm_smu_sat snd_aoa_i2sbus windfarm_lm75_sensor snd_aoa_soundbus windfarm_max6690_sensor firewire_ohci snd_pcm windfarm_core drm_exec snd_timer firewire_core crc_itu_t gpu_sched snd i2c_algo_bit backlight drm_ttm_helper ttm soundcore ohci_pci rack_meter tg3 drm_display_helper hwmon cfg80211 rfkill zram zsmalloc loop dm_mod configfs
> CPU: 1 PID: 362 Comm: kwindfarm Tainted: G        W          6.6.7-gentoo-PMacG5 #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c000000000b03f68 LR: c000000000b03f64 CTR: 0000000000000000
> REGS: c00000001fddf930 TRAP: 0700   Tainted: G        W           (6.6.7-gentoo-PMacG5)
> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24002842  XER: 00000000
> IRQMASK: 0
> GPR00: 0000000000000000 c00000001fddfbd0 c0000000010dd900 0000000000000000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c00000000ffff700 c000000000101558 c00000001be361c0
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 0000000000000000 0000000000000000 c0003d0000348258
> GPR24: 0000000051eb851f 000000000000004a 0000000000000000 0000000000000001
> GPR28: 0000000000000000 0000000000000003 c00000001fddfc96 c0000000040c8828
> NIP [c000000000b03f68] i2c_smbus_xfer+0x178/0x190
> LR [c000000000b03f64] i2c_smbus_xfer+0x174/0x190
> Call Trace:
> [c00000001fddfbd0] [c000000000b03f64] i2c_smbus_xfer+0x174/0x190 (unreliable)
> [c00000001fddfc70] [c000000000b04274] i2c_smbus_read_word_data+0x64/0xd0
> [c00000001fddfcd0] [c0003d00003bc0dc] wf_lm75_get+0x44/0xf0 [windfarm_lm75_sensor]
> [c00000001fddfd00] [c0003d00000688ac] pm112_wf_notify+0x684/0x118c [windfarm_pm112]
> [c00000001fddfe00] [c000000000103364] notifier_call_chain+0xa4/0x190
> [c00000001fddfea0] [c00000000010387c] blocking_notifier_call_chain+0x5c/0xb0
> [c00000001fddfee0] [c0003d000034ebe0] wf_thread_func+0xe8/0x190 [windfarm_core]
> [c00000001fddff90] [c000000000101680] kthread+0x130/0x140
> [c00000001fddffe0] [c00000000000bfb0] start_kernel_thread+0x14/0x18
> Code: 39800000 4e800020 e9290018 2c290000 4082ff1c e88300e0 2c240000 4182001c 3c62fff4 3863f2b0 4b5bf379 60000000 <0fe00000> 4bfffef8 e8830090 4bffffe4
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> No atomic I2C transfer handler for 'i2c-1'
> WARNING: CPU: 1 PID: 362 at drivers/i2c/i2c-core.h:40 i2c_smbus_xfer+0x178/0x190
> Modules linked in: windfarm_cpufreq_clamp windfarm_smu_sensors windfarm_smu_controls windfarm_pm112 snd_aoa_codec_onyx windfarm_pid snd_aoa_fabric_layout snd_aoa nouveau windfarm_smu_sat snd_aoa_i2sbus windfarm_lm75_sensor snd_aoa_soundbus windfarm_max6690_sensor firewire_ohci snd_pcm windfarm_core drm_exec snd_timer firewire_core crc_itu_t gpu_sched snd i2c_algo_bit backlight drm_ttm_helper ttm soundcore ohci_pci rack_meter tg3 drm_display_helper hwmon cfg80211 rfkill zram zsmalloc loop dm_mod configfs
> CPU: 1 PID: 362 Comm: kwindfarm Tainted: G        W          6.6.7-gentoo-PMacG5 #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c000000000b03f68 LR: c000000000b03f64 CTR: 0000000000000000
> REGS: c00000001fddf8f0 TRAP: 0700   Tainted: G        W           (6.6.7-gentoo-PMacG5)
> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24002842  XER: 00000000
> IRQMASK: 0
> GPR00: 0000000000000000 c00000001fddfb90 c0000000010dd900 0000000000000000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c00000000ffff700 c000000000101558 c00000001be361c0
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 0000000000000000 c0003d0000348840 c0003d0000348858
> GPR24: 0000000000000000 0000000000000058 0000000000000000 0000000000000001
> GPR28: 000000000000003f 0000000000000008 c00000001fddfc56 c0000000040ca028
> NIP [c000000000b03f68] i2c_smbus_xfer+0x178/0x190
> LR [c000000000b03f64] i2c_smbus_xfer+0x174/0x190
> Call Trace:
> [c00000001fddfb90] [c000000000b03f64] i2c_smbus_xfer+0x174/0x190 (unreliable)
> [c00000001fddfc30] [c000000000b04644] i2c_smbus_read_i2c_block_data+0x84/0x120
> [c00000001fddfca0] [c0003d00003374a4] wf_sat_sensor_get+0x16c/0x1a0 [windfarm_smu_sat]
> [c00000001fddfd00] [c0003d00000684e8] pm112_wf_notify+0x2c0/0x118c [windfarm_pm112]
> [c00000001fddfe00] [c000000000103364] notifier_call_chain+0xa4/0x190
> [c00000001fddfea0] [c00000000010387c] blocking_notifier_call_chain+0x5c/0xb0
> [c00000001fddfee0] [c0003d000034ebe0] wf_thread_func+0xe8/0x190 [windfarm_core]
> [c00000001fddff90] [c000000000101680] kthread+0x130/0x140
> [c00000001fddffe0] [c00000000000bfb0] start_kernel_thread+0x14/0x18
> Code: 39800000 4e800020 e9290018 2c290000 4082ff1c e88300e0 2c240000 4182001c 3c62fff4 3863f2b0 4b5bf379 60000000 <0fe00000> 4bfffef8 e8830090 4bffffe4
> ---[ end trace 0000000000000000 ]---
> 
> 
> Kernel .config and full dmesg attached.
> 
> Regards,
> Erhard
