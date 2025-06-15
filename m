Return-Path: <linuxppc-dev+bounces-9384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D48ADA16C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jun 2025 10:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bKn9g0fZPz30T0;
	Sun, 15 Jun 2025 18:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749977927;
	cv=none; b=VOOcxbIEjHtQh7ldhLmZv7MAgzUBBtjnHNP6dtesxBMwQdSfjtNmNrZioH0/v4XwLu/F/XwK8RyS7uncrRi1tbWgnZScv2nxjyI2I6nOh8RdJQ7OtXLHM/my3C+2NZWEy26EigQEEmBTH86jC06IgSOAUfj5bYbjDAJbEBi/4pawlTzilVxTzxPrR4jhIQDaX0O8eOiGOLIQQVIU/morOro4VOxE6zK+qVRuPcOLKZ9NFxyWaLgxdKZ8qtYuiIOpldtwn+hzNefw480cGyoivpACAaLNwVVqRVURWASac9FI7F9myp6jaNOyhlB8ak4cja/W2/3qXAEmAV/3DcHtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749977927; c=relaxed/relaxed;
	bh=ECDOn9BtSFAxICQesUDUcQx9m1TARkJEouGERfGWhpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek9gyr9FR+sWTjMuPx29FM4gBzaW1WOe6YnPFvNvE6h1NFWLgY/e2JuHirLwPVVfk8Hr/og2kurxjYEeWmKD2XLPUnWlfMnYAaO6aP7esZEEkXIF56Rd6F09n6N0KT7CkW6vzS38PCOnJQd3Y6VtQdCvyI99wDWH4j8kf6l/o/tuCMjofWwXbIfvquHh8QsK6OJ02gbd1J799ReHLNn0Nd4fAvL2NWTFCqcvOUexNi+CiM5RkKwLDptT+KnI33dYGDAAYk1bxuLcOORzVSVJ/CLiXGuyZQPfHJTi3gfseK/WOeEe50jTlfYaIxRjwlHFYkBn7ngRX+5HxVrg0wiOMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOli6+mH; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOli6+mH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bKn9c5TRHz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 18:58:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749977925; x=1781513925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vd9EWcG9WB3a/aRk95MO6cgl/oduG7IEefBMkFtrx/U=;
  b=ZOli6+mHNHUdg4q2kVUtZYJhcUCRxBHX2aN1plvBCkmBmAhmnjuFFYGS
   DJ4hWz/n+zqu+y3p7qgOASATAeVl6zSDs5UfyNrsDuKClpwU6i8AQmMKo
   hzHQ51bTC8v5nHnL/5Ts3AWbNWlSONik3GMnw27iLLE6X1Vq6qDROq/gS
   hTmZRbamWWZgQg3RGh6kTBSRUTrN9Iqx/LdgUPyDj3ucbOAgeUgVJusNA
   gZkOT6cxxp9Bs92cXtr3WcO+TRDUJ4kzHLfUJ0N9BX9+RKlQxoXX8AeWX
   29xiwaqjnepyp3/FgG7dxYk4833VlwwRdlbswpOdHAX0Ka0Q5NVnvLYBA
   g==;
X-CSE-ConnectionGUID: ZdhOExtJRRG5lWdv+OV8/w==
X-CSE-MsgGUID: 7bHJYycASb2HWap8tllyaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="62748810"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="62748810"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 01:58:39 -0700
X-CSE-ConnectionGUID: xFOJF83dRSGTCkUmbw1xtw==
X-CSE-MsgGUID: m6FSb+f4TFWUuajt+B8hTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148094278"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 15 Jun 2025 01:58:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQjCE-000EDo-0E;
	Sun, 15 Jun 2025 08:58:34 +0000
Date: Sun, 15 Jun 2025 16:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32}
 to user_access_begin/user_access_end()
Message-ID: <202506151632.jvLtNHPb-lkp@intel.com>
References: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/ALSA-pcm-Convert-snd_pcm_ioctl_sync_ptr_-compat-x32-to-user_access_begin-user_access_end/20250612-185240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/8df11af98033e4cb4d9b0f16d6e9d5b69110b036.1749724057.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] ALSA: pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to user_access_begin/user_access_end()
config: x86_64-randconfig-008-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151632.jvLtNHPb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151632.jvLtNHPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151632.jvLtNHPb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/core/pcm_native.c:4033:
   sound/core/pcm_compat.c: In function 'snd_pcm_ioctl_sync_ptr_x32':
>> sound/core/pcm_compat.c:473:70: error: macro "unsafe_put_user" requires 3 arguments, but only 2 given
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                      ^
   In file included from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/compat.h:17,
                    from sound/core/pcm_native.c:7:
   arch/x86/include/asm/uaccess.h:532: note: macro "unsafe_put_user" defined here
     532 | #define unsafe_put_user(x, ptr, label)  \
         | 
>> sound/core/pcm_compat.c:473:9: error: 'unsafe_put_user' undeclared (first use in this function)
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |         ^~~~~~~~~~~~~~~
   sound/core/pcm_compat.c:473:9: note: each undeclared identifier is reported only once for each function it appears in
>> sound/core/pcm_compat.c:473:73: error: 'Efault_wr' undeclared (first use in this function)
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                         ^~~~~~~~~
   sound/core/pcm_compat.c:473:71: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                       ^
>> sound/core/pcm_compat.c:473:82: error: expected ';' before ')' token
     473 |         unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
         |                                                                                  ^
         |                                                                                  ;
>> sound/core/pcm_compat.c:473:82: error: expected statement before ')' token


vim +/unsafe_put_user +473 sound/core/pcm_compat.c

   405	
   406	static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
   407					      struct snd_pcm_sync_ptr_x32 __user *src)
   408	{
   409		struct snd_pcm_runtime *runtime = substream->runtime;
   410		volatile struct snd_pcm_mmap_status *status;
   411		volatile struct snd_pcm_mmap_control *control;
   412		u32 sflags;
   413		struct snd_pcm_mmap_control scontrol;
   414		struct snd_pcm_mmap_status sstatus;
   415		snd_pcm_uframes_t boundary;
   416		int err;
   417	
   418		if (snd_BUG_ON(!runtime))
   419			return -EINVAL;
   420	
   421		if (!user_read_access_begin(src, sizeof(*src)))
   422			return -EFAULT;
   423		err = -EFAULT;
   424		unsafe_get_user(sflags, &src->flags, Efault_rd);
   425		unsafe_get_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_rd);
   426		unsafe_get_user(scontrol.avail_min, &src->c.control.avail_min, Efault_rd);
   427		err = 0;
   428	Efault_rd:
   429		user_read_access_end();
   430		if (err)
   431			return err;
   432	
   433		if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
   434			err = snd_pcm_hwsync(substream);
   435			if (err < 0)
   436				return err;
   437		}
   438		status = runtime->status;
   439		control = runtime->control;
   440		boundary = recalculate_boundary(runtime);
   441		if (!boundary)
   442			boundary = 0x7fffffff;
   443		scoped_guard(pcm_stream_lock_irq, substream) {
   444			/* FIXME: we should consider the boundary for the sync from app */
   445			if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
   446				control->appl_ptr = scontrol.appl_ptr;
   447			else
   448				scontrol.appl_ptr = control->appl_ptr % boundary;
   449			if (!(sflags & SNDRV_PCM_SYNC_PTR_AVAIL_MIN))
   450				control->avail_min = scontrol.avail_min;
   451			else
   452				scontrol.avail_min = control->avail_min;
   453			sstatus.state = status->state;
   454			sstatus.hw_ptr = status->hw_ptr % boundary;
   455			sstatus.tstamp = status->tstamp;
   456			sstatus.suspended_state = status->suspended_state;
   457			sstatus.audio_tstamp = status->audio_tstamp;
   458		}
   459		if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
   460			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
   461	
   462		if (!user_write_access_begin(src, sizeof(*src)))
   463			return -EFAULT;
   464		err = -EFAULT;
   465		unsafe_put_user(sstatus.state, &src->s.status.state, Efault_wr);
   466		unsafe_put_user(sstatus.hw_ptr, &src->s.status.hw_ptr, Efault_wr);
   467		unsafe_put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec, Efault_wr);
   468		unsafe_put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec, Efault_wr);
   469		unsafe_put_user(sstatus.suspended_state, &src->s.status.suspended_state, Efault_wr);
   470		unsafe_put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec, Efault_wr);
   471		unsafe_put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec, Efault_wr);
   472		unsafe_put_user(scontrol.appl_ptr, &src->c.control.appl_ptr, Efault_wr);
 > 473		unsafe_put_user(scontrol.avail_min, &src->c.control.avail_min), Efault_wr);
   474		err = 0;
   475	Efault_wr:
   476		user_write_access_end();
   477	
   478		return err;
   479	}
   480	#endif /* CONFIG_X86_X32_ABI */
   481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

