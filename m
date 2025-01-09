Return-Path: <linuxppc-dev+bounces-4897-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDD5A06F2A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 08:38:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGqs5SQyz30hW;
	Thu,  9 Jan 2025 18:38:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736408329;
	cv=none; b=WgrVSg8XzE5Qzi6ODHam73LzGu6JGf7AhUNUUsMqHiP6w6kYI6590yZVJfT2Cs6cfwtH+4UWynpU+8tgcJMBAzBLhITB15h3x/+z5eXF8ZsFO7a3XQXbiwJbSNhd6S5VmvEuPSjdKaHwZ+28eegm1M2XGBaawufRigbAnGdtAhF09TSHcDLETufIb809j+EUhDFy42F2a3U56dcBYt6x9xDk6OcjTN2xKEieNugz71VVSvlULEZTwyYyTwIiPSBrXUZFBPf/4kKRw/QngqRSYE7LM5yIHERYVxCYye0prdZhP+ZL3NYjBMQ8Bg+c7RQQQGPs1PRT3RemTSoRHeXYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736408329; c=relaxed/relaxed;
	bh=X93jbPO9s9V42go7vMKQgdNYSnFvxLbdUzVEdu/5BwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dYDxBZUiSjUHgq9JHXDUp+SCbjINXjbowyvUSW3PShyI55cgaeOAVMTDSqr3fhQhF7CNqFxL6n8LE70yc9+UtGXzaYd8vRU/lxvYoUt36ZkLja7dZBiixdkaQQaAsU4gfXpwhX/h5HvOf5NhRD4tYOir1epo/kUSfVF8LtEoRGCLq0EZUiySfrZfq2J0jarDJcYi8vE3O7Yr9BMHWaKZgyOwUjuOOMmdMiyvh4SP05unMXY9/ASIp9DZI77FELAKwtm+iLiuVcstatJlrov51WXPvm+9O4Ff8ASKlHLYYZHCVua18Wo/Cx36lz/u5ZoKC3c0++WtoKb5l51on6U5Bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r7DN8e29; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r7DN8e29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTGqr2PBXz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 18:38:46 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso6674285e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 23:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408316; x=1737013116; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X93jbPO9s9V42go7vMKQgdNYSnFvxLbdUzVEdu/5BwA=;
        b=r7DN8e29nDqcSDlPmYNnrhYzFE8mTd88X3jICT6s8bUr5c/kSmYqeb66Hc9+tA1UxT
         KLf719mAF+iY+sHL2OCCLjavQs41GPwlUnSe4ogzx3C07F6OqcWcQZ4//SmnFx0woZgr
         3H05R6jao2jsOULEimxYX4Qt+rKF0kfwlINyfOhk9kaK4wRw4SU/dJyTTFn2+TRBgeCf
         BFtfx9zrl5pItgj/Gfw6fCAPfGKYetafpK0VqXcSlM4s+FeqIZYbHP7Ec+zNsDBeRZ0i
         0XG4L85TcXJbQ3SccatTb52hCylXTTPdI1dqWhShdxC2Z2AWqTZ3OIAPf6uu6dPuE1rM
         kdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408316; x=1737013116;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X93jbPO9s9V42go7vMKQgdNYSnFvxLbdUzVEdu/5BwA=;
        b=Tb07ST203r5f7LlPgTv74FUQE2bF7SbPoySlMUCtXuzJyfjbUMpgW8ZqMVp5DIIcal
         N2GcrsOwD74eTlFTs+9XVsF81aoD2zCpkEANMQhSNAxYs+/FyBN9d4SFN3Me8f5ekG+K
         o1QlbFnX6aV603DER83+QBQOOy99AglwVlkBJeTQUZucIq6TaZqbaX1QjdlB06shr33C
         L0Jaia79+JrBt3wU0ZnPWvfktE79dlz+owIvfPRZe/wBChMe7cCA33Rvm4Y85ZU4al0Z
         stW1XztLQ14Mz9l2ObZlrlFFbBWsNda4kjScMfgNWDjFatgnfAW4p2Muvwhdpee7K5iI
         MC+w==
X-Forwarded-Encrypted: i=1; AJvYcCVLqC3VPnqGOvcbJ1/3/6hIA6g/pPvhvGDmgHnVLm8KMfAMiwePOZVVB1evnKOXwN7tCiRhAVZc7eAV1J0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9C9l/I014mbJl2pH+o+iCj3yWdwmJ+tQIkZJnRXjXTpexkb7t
	Hkw4gQ/gUaEW0sc28JrQjd/HaimnS9idxn8+PmsJIAP8OM/7DqSWXy7lHsTix84=
X-Gm-Gg: ASbGncthk8b0Qp9uHcIoXc40XR9Py8J91TelsKB+UwciK0KmFn74JXgjmrCYXiHWUob
	HfCErXK2MMVjFEdoZn+o+dmpaxhVF9S7eRv3hc3v2FKBd3pqRu8mZUc1mYq2n1974tDWel+Sj8B
	1UX5Y8rXysSSQolj5ioNCTSmlC6PEnaiwIRjIWJA0aNd1Bw21cTefRTW2D0t9VI5HbtujJkU6c9
	JXUrwHdsoZtITIIpZK68ZhZeEnwHUkY08fn3ATsW4ZU2AivWSxms4ggFPfzQA==
X-Google-Smtp-Source: AGHT+IFZVE7PKtub/8dmtCqgw9t04MhMon8Rmhxb6fK46usK/fl3/ujRm1Jma4kd7cHZ1WBV4iESeQ==
X-Received: by 2002:a05:6000:402a:b0:38a:418e:1171 with SMTP id ffacd0b85a97d-38a8733063dmr4221734f8f.37.1736408315506;
        Wed, 08 Jan 2025 23:38:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c76esm996791f8f.47.2025.01.08.23.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:38:35 -0800 (PST)
Date: Thu, 9 Jan 2025 10:38:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, msuchanek@suse.de,
	mahesh@linux.ibm.com, tyreld@linux.ibm.com, hbabu@us.ibm.com,
	haren@linux.ibm.com
Subject: Re: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS
 call support
Message-ID: <dbbe27ff-c9e8-4956-a63e-d2db2ec624a7@stanley.mountain>
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
In-Reply-To: <20250104204652.388720-5-haren@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Haren,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Define-common-functions-for-RTAS-sequence-HCALLs/20250105-045010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250104204652.388720-5-haren%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc/pseries: Add ibm,set-dynamic-indicator RTAS call support
config: powerpc64-randconfig-r071-20250108 (https://download.01.org/0day-ci/archive/20250109/202501090337.xKCGrblc-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 096551537b2a747a3387726ca618ceeb3950e9bc)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501090337.xKCGrblc-lkp@intel.com/

smatch warnings:
arch/powerpc/platforms/pseries/papr-indices.c:438 papr_dynamic_indicator_ioc_set() warn: inconsistent returns 'global &rtas_ibm_set_dynamic_indicator_lock'.

vim +438 arch/powerpc/platforms/pseries/papr-indices.c

3f48afd07934e4 Haren Myneni 2025-01-04  397  static long papr_dynamic_indicator_ioc_set(struct papr_indices_io_block __user *ubuf)
3f48afd07934e4 Haren Myneni 2025-01-04  398  {
3f48afd07934e4 Haren Myneni 2025-01-04  399  	struct papr_indices_io_block kbuf;
3f48afd07934e4 Haren Myneni 2025-01-04  400  	struct rtas_work_area *work_area;
3f48afd07934e4 Haren Myneni 2025-01-04  401  	s32 fwrc, token, ret;
3f48afd07934e4 Haren Myneni 2025-01-04  402  
3f48afd07934e4 Haren Myneni 2025-01-04  403  	token = rtas_function_token(RTAS_FN_IBM_SET_DYNAMIC_INDICATOR);
3f48afd07934e4 Haren Myneni 2025-01-04  404  	if (token == RTAS_UNKNOWN_SERVICE)
3f48afd07934e4 Haren Myneni 2025-01-04  405  		return -ENOENT;
3f48afd07934e4 Haren Myneni 2025-01-04  406  
3f48afd07934e4 Haren Myneni 2025-01-04  407  	mutex_lock(&rtas_ibm_set_dynamic_indicator_lock);
3f48afd07934e4 Haren Myneni 2025-01-04  408  	work_area = papr_dynamic_indice_buf_from_user(ubuf, &kbuf);
3f48afd07934e4 Haren Myneni 2025-01-04  409  	if (IS_ERR(work_area))
3f48afd07934e4 Haren Myneni 2025-01-04  410  		return PTR_ERR(work_area);

mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock); before returning

3f48afd07934e4 Haren Myneni 2025-01-04  411  
3f48afd07934e4 Haren Myneni 2025-01-04  412  	do {
3f48afd07934e4 Haren Myneni 2025-01-04  413  		fwrc = rtas_call(token, 3, 1, NULL,
3f48afd07934e4 Haren Myneni 2025-01-04  414  				kbuf.dynamic_param.token,
3f48afd07934e4 Haren Myneni 2025-01-04  415  				kbuf.dynamic_param.state,
3f48afd07934e4 Haren Myneni 2025-01-04  416  				rtas_work_area_phys(work_area));
3f48afd07934e4 Haren Myneni 2025-01-04  417  	} while (rtas_busy_delay(fwrc));
3f48afd07934e4 Haren Myneni 2025-01-04  418  
3f48afd07934e4 Haren Myneni 2025-01-04  419  	rtas_work_area_free(work_area);
3f48afd07934e4 Haren Myneni 2025-01-04  420  	mutex_unlock(&rtas_ibm_set_dynamic_indicator_lock);
3f48afd07934e4 Haren Myneni 2025-01-04  421  
3f48afd07934e4 Haren Myneni 2025-01-04  422  	switch (fwrc) {
3f48afd07934e4 Haren Myneni 2025-01-04  423  	case RTAS_IBM_DYNAMIC_INDICE_SUCCESS:
3f48afd07934e4 Haren Myneni 2025-01-04  424  		ret = 0;
3f48afd07934e4 Haren Myneni 2025-01-04  425  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  426  	case RTAS_IBM_DYNAMIC_INDICE_NO_INDICATOR:	/* No such indicator */
3f48afd07934e4 Haren Myneni 2025-01-04  427  		ret = -EOPNOTSUPP;
3f48afd07934e4 Haren Myneni 2025-01-04  428  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  429  	default:
3f48afd07934e4 Haren Myneni 2025-01-04  430  		pr_err("unexpected ibm,set-dynamic-indicator result %d\n",
3f48afd07934e4 Haren Myneni 2025-01-04  431  			fwrc);
3f48afd07934e4 Haren Myneni 2025-01-04  432  		fallthrough;
3f48afd07934e4 Haren Myneni 2025-01-04  433  	case RTAS_IBM_DYNAMIC_INDICE_HW_ERROR:	/* Hardware/platform error */
3f48afd07934e4 Haren Myneni 2025-01-04  434  		ret = -EIO;
3f48afd07934e4 Haren Myneni 2025-01-04  435  		break;
3f48afd07934e4 Haren Myneni 2025-01-04  436  	}
3f48afd07934e4 Haren Myneni 2025-01-04  437  
3f48afd07934e4 Haren Myneni 2025-01-04 @438  	return ret;
3f48afd07934e4 Haren Myneni 2025-01-04  439  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


