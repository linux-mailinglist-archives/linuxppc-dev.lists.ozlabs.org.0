Return-Path: <linuxppc-dev+bounces-3957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730619EC081
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 01:15:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7GMS6VW7z30PH;
	Wed, 11 Dec 2024 11:15:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733874570;
	cv=none; b=TgQi68QHeKoNeHvW4ZoyGN+sOedNbyA1TeTGKWPOyWPs4i3Y5r9yvA/Ikak+KJcEweMQpYrXKLGrk8wOGT7wQM+JKLulAIXaFhrX+qHyJy8CKuIDw9vsgYZ8wvW4B9IXhhrsx1gnBBM9S9mSjlOdDfovf6vo41S33HoiS6YuA0SsjWd3XwiT8tLf4P7x/dwCnKoQHmvYUerYRJasPszAI8kfqhgNdVJLY3wMjA6mwYK/ugzAgled88jpi0eaZAY+9rgu+rcH1WxFf/XFXPCxcbs+uBopPiCr9JGc7I2yHAiF8kfgjrQtZa/jq+86Zri9kn8Bm9FBmEXchJP+LWUKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733874570; c=relaxed/relaxed;
	bh=PS7l0d33ZO6FBTryro+pjfe77l6D5X7/u/fq40BAyts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MgS7gkHlC2gyPqYy+RivIPcPfDiftzX17AkQrUW6MqbmVyChf0Tw2ZXSPuPsqvYW3NnHo+wdPzK6aVUxeGSXMkbLn+bbs9E2ZxiDVKZ+1JddQUHp7BPUyMovFBh7YYTVcHZ5idSeD/WkmKUEJKqhJn1GNxNjUKXkl0toncf+08S/HZkmrMpf7SEU6m1FzG0UeG3roA916voQYL2krO/uEW5wA3mAM9PUbpxOev2lWRSEiLjDQeYyIRO1Yrs9KD5/LGXqYSEJckjzdKrwjmBODLfuR2ulw5mLmHr96iLbfQfUbkeWtQo5BUpoL6hTxeMEHFQxBmygDKVTdOIiBGoIjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHLPUz2e; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=jeff.johnson@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lHLPUz2e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=jeff.johnson@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2092 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 10:49:29 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7Fnj19VPz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 10:49:28 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGVwEx021365
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 23:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PS7l0d33ZO6FBTryro+pjfe77l6D5X7/u/fq40BAyts=; b=lHLPUz2eKaNKUox1
	Ub5dhzdNAOoET8wh+maovCNDPMy6t9eby0VQUopQ/MZLa6olLQwy25+UgpQb8ro5
	VlaMWxZAETVnPKvlzO71jszhSUnevwYHdclz20ywMSlVphBPRa3l4C1hylijowi6
	Bk3QIOrIkCQ+2EOFX/Sdw0b2IpZEpF1kH2IJP81FgU3tYlzhsESrVAf/9ob9ocEp
	ghZvyaVc4lOYnIZDKgvxAUu3jssYTEMSXzRSX3MWUGVMwFilQ0CtwOxrY/ufjUY6
	/bXYCyJGZj10oYxR+tKJcKdW/M9cw92yDO1a0dD+j2PcKvi8rQ2zfcQIOo+BmC3o
	GqzWSw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgt2ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 23:14:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so4354187a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 15:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733872469; x=1734477269;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PS7l0d33ZO6FBTryro+pjfe77l6D5X7/u/fq40BAyts=;
        b=dwHX1mW3EfWX4VRg6kc5q0QhG9evusg0q1yA5gREbSjE4wbMrVl1UsjL6TQJVt5pmx
         lYPiaY0wNkLFlNtCO9xA5L+IOLuyR4rfehLEzGLjt49LM3mKWmswcC+T3YD3X0cPg3LR
         23KtdDnxq2jza1XOFsNPLs2LaqMRSUhI/vCcW+514oI3xvS5HwHNiWEvMOGVQgC90a8/
         XiILjE2r5qflVhq9uctAzjv6+tmv8GmQ6IdpS4B7CS2FDk/m/H8s1mcHDC4687oL5bxT
         gBb6I8+DLLr+yP7Ub2+KCCLe1hGT9xyPEuONbCXWXdjCAFHp9ZyeTvPhpe5T8SorQL7S
         JQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUg3n55AAer78ZUjnK6XnV+6TuFfrRIig+uw7NiGdQjrydrsmUtAcc0/CNK5mLuwKzK5Dlt7DWadXnfWg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/Cx/SbvziyB6VZtXjYxXpvFi8DtCUd6f6z9zmb7MaJmQvjQGd
	5gBc5N/QM0/lBoPgFWzxv1tBQVOgmp7Ti8WaVDu/kl52qE+mQTtx07KUKPpw7FF0O3970hcdP0X
	ppNs/n3WVnsIjZLs4oNl0TJ7OJubm7rGORgDRNoHlYMPGMeabgHzSqtdx2EliIA63
X-Gm-Gg: ASbGncv1UXlwGoQFNjTvf82jSXNlk6BNd9Ez0YGNwPaBYZBR8eLfIvoK8Y1rrI/sG/0
	PDV4pxbQyX9bL8Q0AEj5CsSLeKU5thpJ7uIW/jOW3OY6v+QqE1x4EJa6lbiOXx/zf4yFUF14jkw
	sxAl6CUDu3+Kkwt4c2mrWArEYAqQS9chfKA9HghhW1BU1FmHUtNHDZcnLdtkoFBnyCy+bX3q4qf
	JySc5gbbvK2tkqyVhYFtzUS3cIs3HseHGST2UgtRP2Kar1BTYb9eEcdwCoehe4DIt4sfSRZQ/n8
	Nj0Y/P1KAsfZRaeSZZ8BtZdGs2yFJLO3rNLkHad94AWVIKA=
X-Received: by 2002:a17:90b:2d81:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f127fc6f84mr1521934a91.12.1733872468907;
        Tue, 10 Dec 2024 15:14:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBBY7t9Ty+FaaMWRfRUoSNUm5Sp5vin1MZzPlySUpMdXEhND47a5JS9XP+rCTHee3d0P0EmA==
X-Received: by 2002:a17:90b:2d81:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f127fc6f84mr1521809a91.12.1733872468344;
        Tue, 10 Dec 2024 15:14:28 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef779bace5sm7621993a91.31.2024.12.10.15.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:14:27 -0800 (PST)
Message-ID: <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
Date: Tue, 10 Dec 2024 15:14:22 -0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King
 <linux@armlinux.org.uk>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev
 <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
        Oded Gabbay <ogabbay@kernel.org>,
        Lucas De Marchi
 <lucas.demarchi@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        James Smart <james.smart@broadcom.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Louis Peens <louis.peens@corigine.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-mm@kvack.org,
        linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
        live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
        oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aEZpTp8IFnQpOmQCEwgYAjx1ByeSWOln
X-Proofpoint-ORIG-GUID: aEZpTp8IFnQpOmQCEwgYAjx1ByeSWOln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=840 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100166
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/10/2024 2:02 PM, Easwar Hariharan wrote:
> This is a series that follows up on my previous series to introduce
> secs_to_jiffies() and convert a few initial users.[1] In the review for
> that series, Anna-Maria requested converting other users with
> Coccinelle. [2] This is part 1 that converts users of msecs_to_jiffies()
> that use the multiply pattern of either of:
> - msecs_to_jiffies(N*1000), or
> - msecs_to_jiffies(N*MSEC_PER_SEC)
> 
> where N is a constant, to avoid the multiplication.
> 
> The entire conversion is made with Coccinelle in the script added in
> patch 2. Some changes suggested by Coccinelle have been deferred to
> later parts that will address other possible variant patterns.
> 
> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

I have the same question as before: How do you expect these to land?
Do you now have a maintainer who will take all of them?
Or do you want individual maintainers to take the ones applicable to them?

/jeff

