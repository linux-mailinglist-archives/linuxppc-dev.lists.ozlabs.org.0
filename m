Return-Path: <linuxppc-dev+bounces-17032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLHIInYXnGkq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DC1736BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDp36Bjz3cLj;
	Mon, 23 Feb 2026 20:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837226;
	cv=none; b=S4I5ofLU+AT5TCSuDdzk5s+hoObMiWIytOZw8IhzcNLdw77EuNfMCyza4o6FvsuFvu/UVo8jnVa/b1BaGlGW0FbEI9wtHOiamHE9JOthvgM22SdzP4QrZRAgb6BjkUfXdqea2aA3a+MueH3db3HJ7FmsaWBbC1gwzU95h9ACLWy1SUEQk4vFbd0E4wZbFFkVz4eUIrTpIhnwvvNIegP18HyjbDK/Ans6eoRy9yBOCw5WPr4wWd4reFOikXP52/b15tcoT/etcUReM3e3EG4fJ7ls4ic8fHh3t/r4Ww4W1/kn66XERtCUmoMd01MfJYsIp2eU+gq7oJZttBuu8Coj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837226; c=relaxed/relaxed;
	bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXIgsaTfRZsvmuA4TeBEyS/dJGkXxLILL0zpv45321WrvgTIpg7auLf0to3Ku9lmEPU4jcFogptGXhEUMDEpK8WWjwdTGZbCyafOaDp7KrTyqdnVY5unXaM7iqqV+VDMtvNJ7qEhlbWyCP6mGb5TMueIVqb/EsE8vOd9R76x4gi8fVul+hO5ceJCBQp4KFPACEa37cQ2IR3aO3E/L3KOxV0wGyOQu2sH9IkfGbt6dQLihEhMFS6J845Z0rnIJuY2aAjcUzZ4f3HmWVv3PAAbXNgxV4QuUcvBufqtVbj79FFp2Zch19uk3Pb6noJVCigs1++z/gbASWeD657h0SNXhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B8P4JGSI; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUidhbDk; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B8P4JGSI;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUidhbDk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDn30Mwz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:25 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJiM612926616
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=; b=B8P4JGSIDrvN+8Jf
	xosfPkLtE7i66HGsksi8i3rb4IoYal8nCD07AV0JIUJ7UYFilU4fnKJdTZ/XXvgP
	Yt0kpGJOD3DjC0Jc5lQlS5EmifiL3MyyyroOKqUpDnxFp0IYqGCDDKVgRSsTILjB
	OINQ8MueFNEm5d+ebfaRWcG/ML2/xqE3I+Jaz3xHOeb3t/K3+DZfMOSPNTKP7vXT
	isDhdmjEKXg2LTvFYEFAIhCHVh/g+WLIg4FkzctEU+ZVZiJdEj+kfB0VBs6DLlhi
	QJQ7d0bBSzmogpol2zT02hM9JUuq1HNs9Az1Ztud+z+7oqompZmB2PwOAG1eOlCh
	6cbQ4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk407w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so4128151385a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837222; x=1772442022; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=;
        b=MUidhbDkm9jnt2gzPIs4h4QH10t4MR3IfKpHU8y41nxlj34Mj8/olhP0SLWVhgbN7M
         q0420ZUkATEnGPOyu79UZvtw5BHwX0E/AxYACZXIwwT4cSJLJNvxNhijSUi+LxCcm2U/
         QkxeecG3jD0Gg4lwXLUOu/QhIxdE8zS9LvmObZNEo+a7KUEY2FD1c/DFRKqH5Tj2JyGU
         epHe3ZewsUHfKIZLyYIxIMrDVqLi0z/fF1UVoyUs5oENjyZFh1/n1pC8lHG4xkBOStG9
         jLwAyJCckLBTOpyYWLJoJVnf10E/A4G8iCp29VXqD+YuOyxnh9XSa2lhuvJPdVMPoGvA
         WdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837222; x=1772442022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bi9pJMMcFRf/NBCA4ID44huyo8rl64qSPRxoYMM2oCo=;
        b=vKh6nsnzIHOiGcz7klTsLPZxLrF6ukNoKeV6XKVsnXSSvfpDkU2uG15pOTXi2RqRfL
         QrLb15rovIl4k6eZyBRnmX7nkHZPfzNPdRSr9dqE2bujYo1ST3iBn4GgrUcSVvNs6+eG
         qemjh1gatIwMccO/kz+5m1Mb/puzEjnp25h1gUZHWlY/mI3pYgpCdMLNLLuLauRDp9g5
         sNBUtDAy/Nqb7/bKXIq2B3QuX6jtFRN2uTubBbJ/Dr7WmVqFumUCPW0rgaqHqydJQ0ho
         ofP+JcIenVH8Z4xAk0iV7eBx+R7Jd+Y6HiEGeZoDQToRl8LCid4hRirjusrMNTJB3jZk
         wIGw==
X-Forwarded-Encrypted: i=1; AJvYcCVL2QAyy2APYYAK1TeRdJCns3DgMJisdWyR2r9yA0Kpa2QE12qqBNLmHmWcziImHCg+h94+ie1a+ycEhPs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzr7i54PA4EaDfLXlmuv6LfHqt9WkGJkIBT43Wjih6sxZ60S7wy
	fOpJfECf3JJn1gHHJ6P5A9c6T+qoxR5UOsD/HQx2j2pBW0GATWLeqKeAV4Hnz8C8tiNg8FDnzD2
	sRhWlZRHJE0DB8kuXBVUoVyKFLBCUJeym1+zWJ76HpOFNwzMGj1GuJjQbHDgjmR/d7ZQxNHZ8vc
	AU
X-Gm-Gg: AZuq6aKVpZjiMgPCDNo39bUin6x7MH0v3CfUQmiy305TOvfSXMG8pJtOZuA8EU0q6P0
	StA26SL1y3Hh6d/O+/YSaVSHraAY+QRw2ZMM1C24dhk54dJhXFDA/DNWjrIvoJHKN6PsKfKURBc
	d62N5rFPLhJCWQWZe5e4ta1YPzTRwuZXvh3Bi2QgvAWVfHsJGyqleB6IVBk48XCU0YXNpr16GRc
	e6LPhwfCCmwH0Umy3oVCAiUVX9uI8CCVEYzYPyjXrI5D0EmQFXQ5khO2giWZ2OFuJ1eSqs6a0H8
	uSruXuuGBKb7pPMC3I7yYf2SG96hbFE5sO4yHhK+bFCvrrP53NJCEz4iweo6NBWSBci4sqvTNUD
	7+Ui45O6VsPz+0H4a/oNdkfEQEJQZAohbwun7chKoOhdiWKAkalDX
X-Received: by 2002:a05:620a:19a5:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cb8c9cbfd9mr853277485a.15.1771837220611;
        Mon, 23 Feb 2026 01:00:20 -0800 (PST)
X-Received: by 2002:a05:620a:19a5:b0:8c7:17f3:e98b with SMTP id af79cd13be357-8cb8c9cbfd9mr853249385a.15.1771837218557;
        Mon, 23 Feb 2026 01:00:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:40 +0100
Subject: [PATCH v2 11/13] i2c: nforce2: use i2c_adapter-specific printk
 helpers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-11-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JlJZdIjQAEdOPapDxkG0d9x6lJ7pOOWi8wm3ojrJ0As=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcGnrmRWnN9R49qmQ75B8odbY5Rxd6lE9PAH
 XFL9QpoS0aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXBgAKCRAFnS7L/zaE
 wwFtD/9FJmnPrfZtvTNhoH2BGjowqofWNEMiGJ3SSV3vlnqu/q2ovI+NYYSRdIULepLZoRsQxXE
 dYz/t4W3uSTPGMl2Q0VE9oxrPjoDiZdXLZLpisL0TqW1vlOdxuQz00/LXAR4vuC3n4YKAbvvFq2
 /ntNiOJXkZdUhYZsG64K8LoiFOCQSPdjNXCdv09FLCYyup0lxByxltsokWwKsknPY2x1CpUBtNW
 32HN0YKAtXVelAJ2hsDfbDuj5hz1OjOmV0KhV4Ak2jDGogejpUXI7c6hdH4dEqEhIqkuvW4ME8Z
 ZjyUdhdqMKExq9WCyw4NwOJiIxRaJ1Oq9Enf9lkeb2KCh7FwSc3LRcbtfpeIM/c84DWaeCZR8Mm
 oC+mBUGCUE5rvE4tns+2odmLcCcbNscGLHoo58Vi1XxsuSk87nDVohD8VIDy82aXWF3Q5wKFZyM
 KKxXUyjmF3qFSMTwsLCtfcl7vwd/zaSH9BtmzO2dI05Uoz9igDSE2HinYcKfhLeKCDzNtUhWByw
 ZIStk3TbmoyPoX9qMs9WWAQd5ZvxMdFo4QZsHfu+gNUk3DConvZqTV5Dq8qhxPwjmRTSvytFziV
 3bkagq02Zl5WGTJF8d4ftS1nmlSMYLgPaJu8r4j/uJdJVhzdpZg9sXLW8Nmt36NOlHeA/FFrMyq
 OxDgMK/k1/05RRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c1727 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX/IDhhpxhmYA6
 saxEP51wiIZdf0fPu1uLBWTLYP+aSMqLx4FvN6k0B4xlRlljz5xowNC3lKsD9Ax4BhRh1tV9on/
 sRQPogFBibKCW3kmNKawI4ejUIHJrBhefHtnFnS68RKeazdEms0O3eFzoovMYwKONT2q0lyQig/
 v/zfXir/k4Y0uxkp2WpgM0IZqRXbBBzJPKB/bSetlG12rfjQ/XEC9z4BiIgoSZvLBbO9B2U8rf9
 3TBDC2raVJIZztAZU9MrYqfAQOmKOConDB9iU8xhQvBCfyfHeT8lXRiBVbq/qNbbB+9NfMRld50
 +CHno7LRpjdCRPdCJbkglI5WTY3eM8r/G3f3M3+7srdQsok6TbawKyl+xB1D3GAfrZl3fDF5G35
 Ax3xvj+KkrLCZ/2ny9uaLfNOVM+GXhtMRn8W+JA17Ag25qTEeGnRjtqSB34BtiFGcJ8Ec/o/wXT
 SEm6uH8C/4dLDemmQdA==
X-Proofpoint-ORIG-GUID: CSA-hrANwpa8d_xiKvSWDufle4hVig15
X-Proofpoint-GUID: CSA-hrANwpa8d_xiKvSWDufle4hVig15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17032-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: DD6DC1736BE
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 7064fab81eacd416756906cc2ff0567ac44a3465..0cc2cfe8f3c788d84374d40ae8b43cabc467fdd4 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3


