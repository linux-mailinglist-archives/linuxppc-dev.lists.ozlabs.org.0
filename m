Return-Path: <linuxppc-dev+bounces-8976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB9AC7179
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 21:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6zv55yXGz2xGv;
	Thu, 29 May 2025 05:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748460225;
	cv=none; b=OnffUqJhPP2FLpgv8JLRjYhYZlhvvNj9thixRty0ZSInj2LwvhtiKJfdwuFYO7/d8UD1q/rflv4ibhCvhINEl4U2lXcCgqLHhTFd+GluM3epKaRcSgoc24lxpit1+RCtmaGAHZyv+JOFzvNBT4kZR21nwnIr7cXM0bH4y8LO6rhLgLWiUlTUiDXGSVCgUH09/Xbkl8LlOhSDfxUNmwjObfjLCbw+dw9YuflvZcBFgvDeOQ2wynkxPq2zr0+pITtDbw4sxZcwCqza3qB482MOOODXPO+fCZzBJEC9B2zq/3d2E09/0Ttsq8Zw8uMajurUCyA0Sef0AFj6pHRTJ4tiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748460225; c=relaxed/relaxed;
	bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZWKDjoJUiZImwfMgSoi4fhiXtWASiJ9nOZJKCPLW76hOaVilOpy1XaA00Np6Y89QFBJ0A+uuULMrKQRqrtFhyW86EdPhU7vAtx/uvBBdlXqYR+CEVdHWRIgp6Rw/sE85zsYPUbm2DktYlhtJiOl/HoRerXLmUu+IEt3RCDnw5jg6yUvr5adeo4aJafkobc3O7mKtya0RyTFvoHUF6CAKm7VAimW3tdJvKUUIrDj0IarmA2NaFZ+bpsHWLwdSUjllNmYc43TYJuMJ2Tzgew4e2NQoY16SkHdyBKY7ya6vt3VJFOOYH+rdJCQ/VpimHl49k43u/Eenk+8MAezy09GcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhTYe1pv; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lhTYe1pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=dmitry.baryshkov@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6zv44W42z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 05:23:42 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHTlIR022432
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xc89nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab1b8d379so2749986d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=k4G/+82XNPlt+lBNasA4TS/M2xF+8hrw3xxs/LRoN58eq0byXcc6tYj6NUOhbiPxc0
         ItwCzF/wPQ4wezEhuLbjuC+EEVcYmjUNoUgnIbBU+r6QloPG4fTVsIrqDJv99KcDos/J
         xk7Poeh6PNfvqtbC3EkN2M0E182nEBuqFqE2emBH9EwVKXEFxVE1iHx9g8Ct8foalSBM
         14w+Pab+F4EE9YaefOQ0KEtIVcEA3RQbEl+wQWIPWgm/BpkrtF3zTeeG1BvcFgPCUst0
         S4SwJKEQNsgxcpU1xBWmehOnB1p2QiAiUkUDZtYPurs/d29QKEP+3z2l/a08lLeg0Yt3
         CDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/1ry2/6+DSUu0JF50UPSC9aqroYRBUphyavfYZuXg+bwtu1WcfecWk/6axGSCO1iIBHpouKpUSc5eb9k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxdsLCwL4deWhBNk+3OOX+BvCr8/eU2/zNCqLcztQNnVclDwCZH
	bcRlowsX5VMVTSjKIDIdTT3uZlWsZV+kRKbCD6pewmUm571jjTLPaMKB3D4umELABLnsJXdMslo
	8+CfnaSs9sb/2dWZ60V47ltrzWlEjPA9APOHJ9BIvGXIcgL+1iM4MTu9YzIwPbDaGCDBq
X-Gm-Gg: ASbGncutyzaM4elEez5co3HUFlGx+1WYrL99lL4uX5zmqKOfeWtC18enCnUP/vHSqPZ
	7wAm8SNXyNDFxSC2sML+ZrHlNuI3CR6LVWHkj7al3iBFf9cpg5PZV1z6T37Q+2mDwlslgRVTvvH
	Vux3tr6AN0lfIybYmqRNtsNFydLLeQQYKndqMjrBktWVbOz4buR5QUGKEjVWpbQMAxhv+dYAvcP
	KXJ2emcyGlUJ+L4kwSpOt7dE3c0QFy3kAovSGNizyI5HYWopHWsStBWKa4QWVD4c374gZl7ukt8
	EC5xFt35ODoABCOSqoslygyvLkr1e3/lMpSgWZKlWuK6Mifs0noSdhhxKXtsfE26ZCF46PYlKts
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028086d6.11.1748460217325;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
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
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OCBTYWx0ZWRfX29c6JKBArNbK
 MaJaqR4IK9K2L7GSMjBdf5sdrs5EEL1sMhkQzXt3/NPxdpVb645k5NLzRj082u8JLF/qDVE+pwF
 7oo6CbFaWJ39stUsXho2SGZIOO+BLGRT8US+DxtvZykgla994wKvJ2C2OCBRFXDN2kbdA9nLto5
 ikJ3vLpSbaYGgVTaNyLTp+aeLCgptVMQlmc97AO3gKs/XL5xtE+iBHzA+hwTvfJE5RGDaSx6Rwb
 7/gaMtFlJUlX7gnK90dQItgS7T8FT23ihtWALtuilbKEie6q5hI2qbxxNX3Mx/u2xY8ajXTBKQz
 GzAbvR8TVw7UsjziE2m5pxBj75E5APDe6Yx5ICSZNjoMypjZfdpvQd+w+tjXnYNE5xT9RKu73qO
 ua8tSFkUxGpZimt8z5UAlpRKxb3btTCaexXTI8IsM31R+hEz72PauwH1qthJoV+y2k/JTRVz
X-Proofpoint-GUID: ytw5o4lcS506ukai51hWmJMfjLQFJKQy
X-Proofpoint-ORIG-GUID: ytw5o4lcS506ukai51hWmJMfjLQFJKQy
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=454 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280168
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry

