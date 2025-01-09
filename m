Return-Path: <linuxppc-dev+bounces-4898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B38F3A06F4B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 08:44:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGyr1JlPz30hl;
	Thu,  9 Jan 2025 18:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736408692;
	cv=none; b=PDW2y0WDQU/MRGlPBYMOTJIhFRc1cZFlzswuLJ/kgTq+9qL8o/GtUTEH3OPP1laGwJnObyDbOdsSjA+8PotSIK4j+5AiYj6nveIBpq7T8DRflTpKQS3JU9LVVb2OBDGPb/I0glb8VDB6G7FmszyT0w/o4dpyOQN1xT0kxD8UNdanlP2tI/5nql2iLviTa1eSNyt+GgZRmdZ8rHrNhRoqmvj9xRcTtCgmnRitNff0BmzTLqO3aEDNwx1M2IHbhDg6ipNbRGRw7PjhwjpHdqHhK/3qWalZcwsRp/jbc2I+13LGevffYVwhQOzL6ImL+GG5imN66JAX/m3i529QBNC+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736408692; c=relaxed/relaxed;
	bh=hh1x7j7lWYWudfhLYOjBc9jNq9Ri5N5BbraB/aTanEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lJ74ByqOF58nB8R39KcTe1AEsmeZmaWGKxgMfz1GL0yO19Dr2qQ+fafpwhNKTrbJ3W4v72mKMrZmAK997+UHSNueK/37MbBhbRzrsjFtFxGFjuMsLAfixTIFo5x/uTiyw19AnUB+2eSliXqZjGl115yswFV32qUFmwRfvaSQXzme2/yaDO78oZlDs/G6GJ1aIbS01gbdz56fYTvqhkt6H+LvAXNspNdXdqWU9/wrRjWiYnNETSxkSvnlqe0xA2N60c2GdFPz8aX1R1fg+4+0knnWgT4bNDAudk8+9Rd4Qj590Tpo88kW/2gyF4S2iSJgFROZ15LxPHOl+zM2nCNmjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WIrif9mF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WIrif9mF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTGyp4GjNz30hf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 18:44:48 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso6807705e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 23:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408685; x=1737013485; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hh1x7j7lWYWudfhLYOjBc9jNq9Ri5N5BbraB/aTanEc=;
        b=WIrif9mFd5kWtVFun4d01ZHCWoMt2w7GmGFm92CDmVc16GIsKegEViMgLAOo3nJgDO
         50tRAMZztgBsDFHrSzcnAXyZ3QjQ6drDUsDjUBo30zGhea7Jd5p5rgVufDh81mVQSeG7
         YzorPam6SDuKw69BBsjLqPtEHsHD/2UmZ+DyJArYgx5DEiAO52Fqhs6VQR0i0DOl0en0
         h54ueCpdABW8EgcFr3Uq80Eo7YYMSZJEvyT+RRn0rM0gHPLB5MHbCX1VPj48uPmCyV6X
         nB2NT5BjZc6DOZOP1o7gy5AJEws0uCiSemLdHFzFdho9Od9d6gxnBaz6MKE4CgVLqZBF
         8BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408685; x=1737013485;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh1x7j7lWYWudfhLYOjBc9jNq9Ri5N5BbraB/aTanEc=;
        b=CkAO/vuZcBIGJ7GinsFzTjMfVz6FkNSBCYbgkebbAZfjWqTFmvcsbRUYoMemH4nJ6t
         gw+i7EPjqps9OosJBKyEa+LcmvHlrHibNrUXRiBZdFGmMWi1gFRUtqWSDH/WP0BAWC5v
         dJKldAaBEm1g9j7fPlNwRfAGAZmnQojpYp+qGtCwut783V8DGAHSKSnG0apOxvf/tCPd
         DbApanZixoS1Eofkj2pBaa5WDyEvOfHuLIGdi8jVuhD9i1RlkuUUQOcoRnnSXyldWYir
         OnQkTkjwKJ99mpTNgbYvTUpCZctWhuDWQb7gsbY1ye+H+wqIeSUR5sX9FwZqrPcqjiHG
         Najg==
X-Forwarded-Encrypted: i=1; AJvYcCWRPKYZqtAw/GAGNOny7Mf2TMlcTHtWSdV1HVNY9dCpBaLs/ZbNonc4lSfkOIbenJHx1wp4H/XrBm7vIzA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvjRoTw5qwRpLDwXplDjwntjqKBFzYVYk8WNXsmsHRRcYz3Efk
	WkWz273saqdqcSkt+ORorkmGKlFLwd1+CwkP1r2ebXemMNAZVwOUQgr+9frG/Zw=
X-Gm-Gg: ASbGnctRsBDKKSXW9cxsqOJbYoXCjQ6e80ZzokpmVpKxVWR2I8iluPDEqYKL82yljiH
	rsIg9Cz8eTnp6caNrZY9lze9p7MHJ4F4pezgC9VnN2XgOU01AVSlgA9sGppE2RvCuSbA5ycPV+d
	EjrZ9VqT4qFYEzu00KP4cLWmsXlT8nBbR0Z46ZWfZQ/EV/VH5jc6HFKUkpp6xhNWwul2zlMl9gp
	x8viSzIDqPkQTpio3R5QjgdtUJPXT4naneIrWu0gp4C49A1dQb3Wxcy2XtLmw==
X-Google-Smtp-Source: AGHT+IHEZyaIVzclqxdjP4ZOdG6lan/GRGVy2gb2M3EakOZNST5naAVRXF+JitBOxJ6aEWygbw7++A==
X-Received: by 2002:a05:600c:4f52:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-436e26e259emr49159755e9.20.1736408684620;
        Wed, 08 Jan 2025 23:44:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6401sm46146425e9.2.2025.01.08.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:44:43 -0800 (PST)
Date: Thu, 9 Jan 2025 10:44:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state
 RTAS call support
Message-ID: <b4313bdb-29ba-42c1-9011-4bb558d056ba@stanley.mountain>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250104204652.388720-6-haren@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-6-haren%40linux.ibm.com
patch subject: [PATCH 5/6] powerpc/pseries: Add ibm,get-dynamic-sensor-state RTAS call support
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090552.UzEfb4QU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501090552.UzEfb4QU-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:496 papr_dynamic_sensor_ioc_get() warn: inconsistent returns 'global &rtas_ibm_get_dynamic_sensor_state_lock'.

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +496 arch/powerpc/platforms/pseries/papr-indices.c

e44fb25ad9fa03 Haren Myneni 2025-01-04  452  static long papr_dynamic_sensor_ioc_get(struct papr_indices_io_block __user *ubuf)
e44fb25ad9fa03 Haren Myneni 2025-01-04  453  {
e44fb25ad9fa03 Haren Myneni 2025-01-04  454  	struct papr_indices_io_block kbuf;
e44fb25ad9fa03 Haren Myneni 2025-01-04  455  	struct rtas_work_area *work_area;
e44fb25ad9fa03 Haren Myneni 2025-01-04  456  	s32 fwrc, token, ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  457  	u32 rets;
e44fb25ad9fa03 Haren Myneni 2025-01-04  458  
e44fb25ad9fa03 Haren Myneni 2025-01-04  459  	token = rtas_function_token(RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE);
e44fb25ad9fa03 Haren Myneni 2025-01-04  460  	if (token == RTAS_UNKNOWN_SERVICE)
e44fb25ad9fa03 Haren Myneni 2025-01-04  461  		return -ENOENT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  462  
e44fb25ad9fa03 Haren Myneni 2025-01-04  463  	mutex_lock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  464  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
e44fb25ad9fa03 Haren Myneni 2025-01-04  465  	if (IS_ERR(work_area))
e44fb25ad9fa03 Haren Myneni 2025-01-04  466  		return PTR_ERR(work_area);

Add an unlock, same as with the _set() function.

e44fb25ad9fa03 Haren Myneni 2025-01-04  467  
e44fb25ad9fa03 Haren Myneni 2025-01-04  468  	do {
e44fb25ad9fa03 Haren Myneni 2025-01-04  469  		fwrc = rtas_call(token, 2, 2, &rets,
e44fb25ad9fa03 Haren Myneni 2025-01-04  470  				kbuf.dynamic_param.token,
e44fb25ad9fa03 Haren Myneni 2025-01-04  471  				rtas_work_area_phys(work_area));
e44fb25ad9fa03 Haren Myneni 2025-01-04  472  	} while (rtas_busy_delay(fwrc));
e44fb25ad9fa03 Haren Myneni 2025-01-04  473  
e44fb25ad9fa03 Haren Myneni 2025-01-04  474  	rtas_work_area_free(work_area);
e44fb25ad9fa03 Haren Myneni 2025-01-04  475  	mutex_unlock(&rtas_ibm_get_dynamic_sensor_state_lock);
e44fb25ad9fa03 Haren Myneni 2025-01-04  476  
e44fb25ad9fa03 Haren Myneni 2025-01-04  477  	switch (fwrc) {
e44fb25ad9fa03 Haren Myneni 2025-01-04  478  	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
e44fb25ad9fa03 Haren Myneni 2025-01-04  479  		if (put_user(rets, &ubuf->dynamic_param.state))
e44fb25ad9fa03 Haren Myneni 2025-01-04  480  			ret = -EFAULT;
e44fb25ad9fa03 Haren Myneni 2025-01-04  481  		else
e44fb25ad9fa03 Haren Myneni 2025-01-04  482  			ret = 0;
e44fb25ad9fa03 Haren Myneni 2025-01-04  483  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  484  	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
e44fb25ad9fa03 Haren Myneni 2025-01-04  485  		ret = -EOPNOTSUPP;
e44fb25ad9fa03 Haren Myneni 2025-01-04  486  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  487  	default:
e44fb25ad9fa03 Haren Myneni 2025-01-04  488  		pr_err("unexpected ibm,get-dynamic-sensor result %d\n",
e44fb25ad9fa03 Haren Myneni 2025-01-04  489  				fwrc);
e44fb25ad9fa03 Haren Myneni 2025-01-04  490  		fallthrough;
e44fb25ad9fa03 Haren Myneni 2025-01-04  491  	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
e44fb25ad9fa03 Haren Myneni 2025-01-04  492  		ret = -EIO;
e44fb25ad9fa03 Haren Myneni 2025-01-04  493  		break;
e44fb25ad9fa03 Haren Myneni 2025-01-04  494  	}
e44fb25ad9fa03 Haren Myneni 2025-01-04  495  
e44fb25ad9fa03 Haren Myneni 2025-01-04 @496  	return ret;
e44fb25ad9fa03 Haren Myneni 2025-01-04  497  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


