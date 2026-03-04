Return-Path: <linuxppc-dev+bounces-17691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHl6DEf1p2mtmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292F1FD120
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 10:03:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQmsZ2rPDz3c8h;
	Wed, 04 Mar 2026 20:02:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772614978;
	cv=none; b=HCua9vlaFn49s+hcAv1IANOwv7ouJ8tXCQdinVOL+EHyiBq/PxRXt6sFtyZXLxHRzy9NN4mH4pzQUtzhr0iHnUdcePM1tFXcCHqx6s/N6JOvn8x+M23gri63PGB5h/IWtQ3/57s33gJHOVHjWXPxqlZcYp6tfap4ijFy4wh1osV9boYVtVpLJjN906uXvc2sVKhMmDa8CHCIrej3E83/XkP7N8E94PC6ZAu1hKEuv54ZcQLLkUQmncnL3AN2MsIA32iubo9NUJA6TtfpFGHhCIgEeAkIXKN1o9c6lKag7SZRSJ216cVcBdQ0dDo86nJo+5HSQtc9lA07noUeYwuTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772614978; c=relaxed/relaxed;
	bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EWLQ2HW3l7rm7JYvGq2lNUiH2VSi7Y9nuq7xAM35tbvFcYm1m930Z3QlwugdRRwH0KBrt/CW4lcQINMdmWYdSxJYvTlWw9gx52fke2Lk41rwht1A3S+zApmFnC4qKTaZgjCHOkZPSKgA5fUrnfpcKYZqAR+7SRjtL2hiqIG2vjytfctZQEiyJGONzoBYmpEPHOFXNLb5taRyPjMmXtdx1lcN3HISF/RD3HfEO8F7PrNMeZuSplewBhQml55vPubHgvdwUgOhsKhoX+Aa6lG8CeO/4LlQIw4YDvydKJjN+ljSwuarL7QZ4U+GyHLe7sXgqjAhQhFDHPjsd22+lAaYJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P11c3pKE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbp2ipA0; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P11c3pKE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tbp2ipA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQmsY1Dfnz2yFY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 20:02:54 +1100 (AEDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPXZ152531
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oemXeHFiAD8fwC6Dvlocm0
	aqSqueWx/Mi2JGUCBaDkQ=; b=P11c3pKEW59ZBshwgxJxorRIb/Cvzay+2NGICC
	TUIUByAaAlcJ4kZ2u+UQRh4xlir4oUZ+Q4bGcQlsbPpUNxvswgzYkQGeGnf14P6Z
	cQyRSBvUq28fC5gx6GVvkfsI0fZSqw/uzBYgsGj4SDJoTSWaerzUDMO3bOVZa+GO
	WHl188CFGvZ1icutpN8PmB1fhnMHjGSISUiSpwMVEYdAcjiiBfAlQiuod4toeHcj
	O0r8mK1uDg9SCCe2nZPDDCy7UP7vKNiEqXPDGeazBlvFXHErYyAGTVHX6OMBYVqK
	snkDYFGNPNyWf9q16AhJCZHo6WGOQbvwCO3SUEWD6ILYkaaw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvjxty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 09:02:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a174bd442so47036326d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 01:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772614971; x=1773219771; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=Tbp2ipA0nqlfN7kr+9RPcaEdNbwsMnkR7VgLBLhoIfmu4gfgrYJEAXyNmOWUBwyAeb
         yInt/Gu31joAnrMucCuPZKz3SNru9FNqmCe5xlER8iRejWhrdNxA+9qKX8MZtc4HHsiZ
         599Re87kV7ACWMbpnRoxXbGezWieck/GrK8/6CJF60Z5hdNYW5rCO8pcWniny4dScGK+
         IuNoEip5jWRpvDrAhhN3g3oBQhNzfyhOULVuSCHAApJX7dDByUNhppTtrJDJQSNWsamy
         o3Zg9rYx9Ee3JGLdbbO/Mg0PecU/yuPtn9X+2w+aQoFUKqb09cSWHYwYg1pZCkui0Lu5
         KIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772614971; x=1773219771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oemXeHFiAD8fwC6Dvlocm0aqSqueWx/Mi2JGUCBaDkQ=;
        b=kEZOwjQyQQhySfLyClmARfg6+vyZvRpXtuqwiAQgxb98m3nntSvr/0oUmPMQI5tM3C
         nu/dQEWsQ9ijvxQvayyq4u/P6R4lHCig2UbVs61F060IB1NtSfbPJieIpFVx2ovzPXvh
         8lSYq23q9p1Rf2YD3Mg2QtCDvT+GErTW7zkplYns5+g+DITnHUQHiE2Ba+mUq4i1woos
         e2vfb0avWYTxtvD829hKKWk5mNm3oXFuSindJQ9bqQN4ccnhB2Mp3oAWemr2K4f72p/a
         dlTkbBp4o3Qq1sRNYPitbAmM0tDzdXgHWzcYWFgRihz9f6p1Yex/WrAZG92ovCluOFqL
         QRoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqz2maakJ+Rh8ju+WjwRCeGKp8+4Ur1zy7poHXrR4SxfjQebp6I9z43SYE04JScrRGGRJMTr6X4v8gR6I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7ggXfZxn6VSH2RHyII78ZhIy6a6r3eC6ESsxN97zxfEzXmhqC
	iCf7rT0kx6JsSh3mZT4FkarOkW75+Wds0rRFdoBK000Mn0exEzhoAfnug4M+6vtqp/SxQVji613
	+NoDnyPts9MsiYRs5skvgGMmYmqMW764/6Adz5LmN0ffF+UYQJlbUiXHq1/jo5HktRlS0
X-Gm-Gg: ATEYQzwMfql/9KWyQX6D0ZEwCpHBp3bntqiAZX3xl827Yes3XSkWK5VYjTqw7m9ouNZ
	AK+pe4kvc4qMfs/FYsFHAHUgcxGMxOyRNP6m95krS4GPrOp3T0eVGDkshgMysboPcxrtTGanviN
	SIQ+CQ3YCCdK1pMyFkZx4L91BZjOOhDfO2oc7Zn+bt7SnFsot3Bj9LkKSu0yjIZYoSDP308SJZd
	gxi03ICF2IvDuhffbCiNQdwwZLNNseKlrE64Yy3CL82Ug1sfznhJa2p4PhdRZzrqhBG5V6rv8jj
	Gps4AkXTbWU0LHnlZi3UH3nHhOESSVmIU9CXoktgmSZilGCCBNpbsgXz39ZGmekt1axLcTEHXZX
	5rxmeRFiYb8+juow36l60gwWdi8Yp7wyI7ODJ2nmZDU+6z9rQ1YGm
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156644385a.75.1772614971141;
        Wed, 04 Mar 2026 01:02:51 -0800 (PST)
X-Received: by 2002:a05:620a:258d:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd5afd3c5fmr156638885a.75.1772614970677;
        Wed, 04 Mar 2026 01:02:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:edb0:af14:f4c7:c6ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851ad02ffcsm3644895e9.20.2026.03.04.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:02:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Wed, 04 Mar 2026 10:02:21 +0100
Message-Id: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAB31p2kC/x3MTQqAIBBA4avErBsw+6OuEi3ERhsCJxQiEO+et
 PwW72VIFJkSrE2GSA8nllDRtQ3Y0wRPyEc1aKUn1asB/c2C4vCyEhx7JD3OZGa7GLVAre5Ijt/
 /uO2lfCyoFdRhAAAA
X-Change-ID: 20260304-gpio-of-kconfig-e257ea7c9a09
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vzKg2CmRZRz9tDx8jerfN1FNHIadNDJlHWQvRijQXa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpp/UlV7KEbnku5SM6ln9ww7x/7ZvkbRgT9akwX
 ZTKY7PzrYiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaf1JQAKCRAFnS7L/zaE
 w5VxD/sFAI2igPWylEwWYYIK15BDRKiW+6YYGAfBqLpYl9ZCdmVgeZD06r7JMW6noA5hFzEkv66
 pvwjnkkl7u3DFOw8V3GJsnoNOOowaj6Scqektj5r5FiQwuHc5I8abfSLEsV+V4cO0v7ZKq29NWM
 Slk6AkPOz4Dk9WvQW94bOEYC8bLWudd5dgScZ5sDtsXB2ZVkOU4Un4t2pkX+8AD230La5Ao4gHq
 2nfPT5kU2Ogk9EZLOE66LyX5r1zO/Vj5OAtjgB62Cm3oV01ZLErMP+entT0fo8yY5ScmRMaFpUo
 3lszEgJlDfA1/ZDe7YGcx1Iqfxnt3/YFva8swh9EU9K0fTllltoiemPhEcDsQa5L+CR683lH/5a
 FVYvSL0skiru5EDCrTdHr9OUO3u/OD/twdunXvFtT4F/LzO3iDxvE4CEGqlnI+tyOOv2IzMGGGv
 vbQtrKM8lRKn0N/IC77/tT7IX4aqycoE1lunxb24p/sgoxdJc7e5jEgkPRPmXIOB76VxKbGc0+n
 1F3iiZCY9qL3lsySV+j+61W3cjjIYoI/L5iDJbnwnolQDGAK7PEXv6yL4e4j8aGyXOwDd8Gq1aO
 avM0vTJekP9BWzuxJMN/Y9MbMnlPvTbKHGY0BPgrchdO2JNNJztzOUyRDL4+1lGfij7PFp3V2kf
 qVTMwUWNMgBvbzQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2NyBTYWx0ZWRfX7eOxaJl6poVf
 AJIJoX9IsNrISboqDfsuwYppXFaj6W01Tlp0Lug01Ly4o5lks1h8RphoAfMc9gPFACQBzUe84ky
 /o95YGWBBT5CxFcYB6hIG0NsYdUW77LBN49PomgQkr5s/gNhqrByvyt07MDnV/kUhDdWT8TlJMC
 EkLVLE/n9ZCChGCCjrqTTZL2mZIu8x3sYZJm7MBt8x9upaVl0y9uVMKYqGl5ybNfayA5ICj0JRe
 OfCHXLCfVIMNfMTzqdCcQcBwZatR9nhLTKpnrm0SIprBp/CPdaiS24wgx9tyQLRQADiSztp8vfr
 ubmd6ay0nyY4oyrY8jKCDwiTL0nBAPKUv+0FqUuYui07Hyt5IoLYTuEywELRZVr/pj0rwcjQ3OK
 nQilmGmfA5Q/a7Rx98+1Aj77xWe+zs/xITdlAAFrfILQYrKR2IggXNcaa7UEVzs/iueIxHQySYg
 3uiQKaPB9S2gP8vUvew==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a7f53c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RbMT-lXscSRh0E1VkaUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 794LqtFRAtAQkr4xYPTlw_7FgyG5OkWk
X-Proofpoint-ORIG-GUID: 794LqtFRAtAQkr4xYPTlw_7FgyG5OkWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040067
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4292F1FD120
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17691-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:abrodkin@synopsys.com,m:vgupta@kernel.org,m:oss@buserror.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:dvorkin@tibbo.com,m:wellslutw@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:linux@roeck-us.net,m:wim@linux-watchdog.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sre@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-leds@vger.kernel
 .org,m:linux-hwmon@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-pm@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,synopsys.com,buserror.net,linux.ibm.com,ellerman.id.au,gmail.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,baylibre.com,googlemail.com,tibbo.com,roeck-us.net,linux-watchdog.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

NOTE: Each patch in this series can be picked up independently into
maintainer trees.

CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
module. The module itself handles GPIO lookup via the OF-node tree and
is automatically enabled on all OF systems. It does not export any
public symbols to drivers. There is no reason for them to select or
depend on it in Kconfig.

This series removes any such dependencies from Kconfig. If a given entry
has no other dependencies than OF_GPIO - they are converted to OF to
avoid new symbols popping up for everyone in make config.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (14):
      arm64: Kconfig: drop unneeded dependency on OF_GPIO
      arc: axs10x: drop unneeded dependency on OF_GPIO
      powerpc: drop unneeded dependency on OF_GPIO
      net: mdio: drop unneeded dependency on OF_GPIO
      regulator: drop unneeded dependencies on OF_GPIO
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
      leds: Kconfig: drop unneeded dependency on OF_GPIO
      hwmon: drop unneeded dependency on OF_GPIO
      watchdog: convert the Kconfig dependency on OF_GPIO to OF
      bus: drop unneeded dependency on OF_GPIO
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      power: reset: drop unneeded dependencies on OF_GPIO
      media: i2c: drop unneeded dependencies on OF_GPIO

 arch/arc/plat-axs10x/Kconfig           |  1 -
 arch/arm64/Kconfig.platforms           |  1 -
 arch/powerpc/platforms/85xx/Kconfig    |  1 -
 drivers/bus/Kconfig                    |  2 +-
 drivers/gpio/Kconfig                   | 53 +++++++++++-----------------------
 drivers/hwmon/Kconfig                  |  1 -
 drivers/leds/Kconfig                   |  1 -
 drivers/media/i2c/Kconfig              | 12 ++++----
 drivers/net/mdio/Kconfig               |  2 +-
 drivers/pinctrl/Kconfig                |  9 ------
 drivers/pinctrl/bcm/Kconfig            |  4 +--
 drivers/pinctrl/meson/Kconfig          |  1 -
 drivers/pinctrl/starfive/Kconfig       |  2 --
 drivers/pinctrl/sunplus/Kconfig        |  1 -
 drivers/power/reset/Kconfig            |  8 ++---
 drivers/regulator/Kconfig              |  2 --
 drivers/staging/media/max96712/Kconfig |  1 -
 drivers/watchdog/Kconfig               |  2 +-
 18 files changed, 31 insertions(+), 73 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260304-gpio-of-kconfig-e257ea7c9a09

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


