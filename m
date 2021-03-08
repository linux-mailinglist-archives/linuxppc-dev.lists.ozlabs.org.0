Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F0331125
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 15:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvLgv5gNrz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 01:43:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VNEcNxDg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=ckoenig.leichtzumerken@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VNEcNxDg; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvLgT2b8Rz3cJc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 01:43:32 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id jt13so20932748ejb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Az8rhA9caHuo5zJCEYV8g7y4jULWEe6VaW1tk9jHX3I=;
 b=VNEcNxDgmlldA/u8di4huVxTlpa63PWMrv1nVVNhGIhelZ8P8KTUV7fB2hzpu2JE3L
 JR2nNA8A2rPTgt7Y7SHLNz36wk7715OF6V3QdYK1ynr1bpibEr2d2s0obXyasg2pViE4
 Y90OLyHBTliRuLh6i20zM+WckQYC6ADJexiAtBJF7QFrMZNV4vniXv0kP3lIinLsrmf7
 dkfZBqm9FUtnoK3l4G4wpC4ZrT06TML31imjHUZe53UU0aWfQVJ/VJskJXmrYYHDWDQU
 UL2I7iIpchwsyzl9tknM4XrRJH8B5zXEuJe0woH/m8++6yUQZWjaJBrHWwtvnEOgMVig
 tJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Az8rhA9caHuo5zJCEYV8g7y4jULWEe6VaW1tk9jHX3I=;
 b=RRluC5RaUWfI+Hq1WHsekxFqiT8ef4L4TCMrqh0RG2xm0Z0hrY283xtAJpGSd2/zyP
 PBa/JkuZ3RFpZsygo2YE/cKNpvKyMLTyqL+mjm1pdUD41aC42N2INLF+ewTVOCej6mwp
 Z0FD8U1sLeUwgLLvKmMtsQkNI5CYImi4KRng352Igqj2NlS8ml/I9VpEV8/OLXrY10OO
 p7HlB8V/bI3ABj6DiBTGavZqtrbT4Dnrv0HY1YgbfQJ8UxjaBznNroGOoA7A2K/cO/I6
 TCvvZM+8I0r9NLhhC2J54GQLr470GZanFXouvoNjFJUrLiz5Ccq4TMG0pzr9B4o0pyuL
 FtHA==
X-Gm-Message-State: AOAM532lsGOzALmoX9pX47u8f85tmC1gp5JSMJKLlAJN04IPhT+DB8IQ
 RPoeVpwn6b1debWq1PA7dvg=
X-Google-Smtp-Source: ABdhPJzLVFusCJGHsLRE2whpfSe3NJ3sQRGVskencktMChCB5X29IBCZfnhGe0pbrM61syySA7Jj2g==
X-Received: by 2002:a17:906:d787:: with SMTP id
 pj7mr14938160ejb.257.1615214606892; 
 Mon, 08 Mar 2021 06:43:26 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:4794:2f8d:7bcd:36a5?
 ([2a02:908:1252:fb60:4794:2f8d:7bcd:36a5])
 by smtp.gmail.com with ESMTPSA id d19sm7259446edr.45.2021.03.08.06.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:43:26 -0800 (PST)
Subject: Re: [PATCH v1 12/15] powerpc/uaccess: Refactor get/put_user() and
 __get/put_user()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 kernel test robot <lkp@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Evgeniy Polyakov <zbr@ioremap.net>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <3c174edb80d2d37af6b08c637b09268f675e5371.1614275314.git.christophe.leroy@csgroup.eu>
 <202103071822.4cXbH0Xp-lkp@intel.com>
 <bfb95917-2b84-59f2-7f22-22fd6d63d09a@csgroup.eu>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b282b744-ea10-aedf-da10-832af7565f24@gmail.com>
Date: Mon, 8 Mar 2021 15:43:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <bfb95917-2b84-59f2-7f22-22fd6d63d09a@csgroup.eu>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@01.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The radeon warning is trivial to fix, going to send out a patch in a few 
moments.

Regards,
Christian.

Am 08.03.21 um 13:14 schrieb Christophe Leroy:
> +Evgeniy for W1 Dallas
> +Alex & Christian for RADEON
>
> Le 07/03/2021 à 11:23, kernel test robot a écrit :
>> Hi Christophe,
>>
>> I love your patch! Perhaps something to improve:
>>
>> [auto build test WARNING on powerpc/next]
>> [also build test WARNING on v5.12-rc2 next-20210305]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>
>> url: 
>> https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-Cleanup-of-uaccess-h/20210226-015715
>> base: 
>> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
>> config: powerpc-randconfig-s031-20210307 (attached as .config)
>> compiler: powerpc-linux-gcc (GCC) 9.3.0
>> reproduce:
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.3-245-gacc5c298-dirty
>>          # 
>> https://github.com/0day-ci/linux/commit/449bdbf978936e67e4919be8be0eec3e490a65e2
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review 
>> Christophe-Leroy/powerpc-Cleanup-of-uaccess-h/20210226-015715
>>          git checkout 449bdbf978936e67e4919be8be0eec3e490a65e2
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>> make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=powerpc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>
>
> The mentioned patch is not the source of the problem, it only allows 
> to spot it.
>
> Christophe
>
>>
>>
>> "sparse warnings: (new ones prefixed by >>)"
>>>> drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect 
>>>> type in initializer (different address spaces) @@     expected char 
>>>> [noderef] __user *_pu_addr @@     got char *buf @@
>>     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected char 
>> [noderef] __user *_pu_addr
>>     drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>>>> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect 
>>>> type in initializer (different address spaces) @@     expected char 
>>>> const [noderef] __user *_gu_addr @@     got char const *buf @@
>>     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected char 
>> const [noderef] __user *_gu_addr
>>     drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const 
>> *buf
>> -- 
>>     drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse: sparse: cast 
>> removes address space '__user' of expression
>>     drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse: sparse: cast 
>> removes address space '__user' of expression
>>>> drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse: sparse: 
>>>> incorrect type in initializer (different address spaces) @@     
>>>> expected unsigned int [noderef] __user *_pu_addr @@     got 
>>>> unsigned int [usertype] * @@
>>     drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse: expected 
>> unsigned int [noderef] __user *_pu_addr
>>     drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse:     got 
>> unsigned int [usertype] *
>>     drivers/gpu/drm/radeon/radeon_ttm.c:933:21: sparse: sparse: cast 
>> removes address space '__user' of expression
>>
>> vim +342 drivers/w1/slaves/w1_ds28e04.c
>>
>> fa33a65a9cf7e2 Greg Kroah-Hartman 2013-08-21  338
>> fa33a65a9cf7e2 Greg Kroah-Hartman 2013-08-21  339  static ssize_t 
>> crccheck_show(struct device *dev, struct device_attribute *attr,
>> fa33a65a9cf7e2 Greg Kroah-Hartman 2013-08-21 340                   
>> char *buf)
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  341  {
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26 @342      if 
>> (put_user(w1_enable_crccheck + 0x30, buf))
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  343 return -EFAULT;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  344
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  345      return 
>> sizeof(w1_enable_crccheck);
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  346  }
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  347
>> fa33a65a9cf7e2 Greg Kroah-Hartman 2013-08-21  348  static ssize_t 
>> crccheck_store(struct device *dev, struct device_attribute *attr,
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26 349                    
>> const char *buf, size_t count)
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  350  {
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  351      char val;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  352
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  353      if (count != 1 
>> || !buf)
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  354 return -EINVAL;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  355
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26 @356      if 
>> (get_user(val, buf))
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  357 return -EFAULT;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  358
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  359      /* convert to 
>> decimal */
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  360      val = val - 0x30;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  361      if (val != 0 
>> && val != 1)
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  362 return -EINVAL;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  363
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  364      /* set the new 
>> value */
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  365 w1_enable_crccheck 
>> = val;
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  366
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  367      return 
>> sizeof(w1_enable_crccheck);
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  368  }
>> fbf7f7b4e2ae40 Markus Franke      2012-05-26  369
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

