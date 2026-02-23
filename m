Return-Path: <linuxppc-dev+bounces-17028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PDvAVQXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BB173672
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:01:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDc17zhz3cFw;
	Mon, 23 Feb 2026 20:00:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837216;
	cv=none; b=HPZ1MY0RXtDvMp3QvI8Otu3I8Ulf8R6Vb+bsi9aykUWn9WCc5T2YNNIBTebvVMz1U8zJ+UbX90ysrlJMC4dg2UQyiac8f7/88Slz2TXey/28miUUwTV8QPnppqi/xaYbxLL8e4g6cD3IOSKzrslzoQgZvvZMypT6IxYpxZOk1l2Mh/mtv37a5M4JyG+x3xzNACKpNdbjcNVMzkJJPhpdlBzQBmvvg0b7rRbsxohFw2GKVMEZG8VYpQaoqYZAXr7c4Z48oQ/C0pTRU0S8D9cmfj6+C32X1Ey3pZXWHB1Rd6v0/mjZP2wjxROtHn1Sz3li5Hn1oxkH/+bu8mY64lRZag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837216; c=relaxed/relaxed;
	bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHTrBbWlcv1GqUt29ov0T3lOYzTGQyRTvtj0uiB1blmgCYdCqJi6m5vUrh11iw+s+fX8zrYbotTQukJEkmXbmbPNczbUf5790k1hAU+xLoRtcgS90NaYrP0fTJCYySkogXnUUlZPL9y+LA7ISXxqy/RBXR1HPBTJMcLWeO3Teu6h2lGvPMlDf+y41UpoYTmG3zjjQcqTM5leT37LkAfXzTkHAKygFygz+VqpCQMYwhCMNoIzbc5TMp7VR6LeQ+cfFedHnq8UpZposlO4FsAOWnt6V12mI974ibb0zyNkZTIp+fMcbI8boqGwXLgtRmmP90WeH96BhmEjqeZW1iDRhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSRJZgRv; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYvcqI88; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PSRJZgRv;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYvcqI88;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDb2CXSz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:14 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMQd6P3552830
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=; b=PSRJZgRv7ZFbB8fJ
	Ct2ywslvEODZYZD0Dteb/AtL1psfjK7xJSxCfYTywYJyUj64Py+RsIS4jn2Sz3wg
	SrvlcHpwdObHdk+hcFJmGMb+OeDJ/dRXBm1yqjE3G0dX9n7lwbQadBpiEgKTxSQ4
	Y27JqAhe3EVd56Q1Uov6c0DP0GJoDT66dNRd/1/L3bxGBd9MzNc/PSO1pYizrJqU
	1gipxi8xP9ya49/xGglniiT0N7PADwozdAJ29h4itJooEMm0obJDAcCpYuzck7RZ
	h7WdCL2Oi0JtixPv+YwAa3Y5wpxBCjZ+Voi4T291wstbp6U3XXSOHLMBBp3dS0vx
	n4jQwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m1d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5033c483b74so603902571cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837211; x=1772442011; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=gYvcqI88NHHnCeIJO2s2DCSWfuWlbX9bFxd9eWDIcQHlcdMIIM9zFyUsN7LLk31pi9
         Ac3dlIKKsZ5qhsldFluncGr8+y9gXycj1ewn9kM+jpFoSV1tqUgReWOPrtLo8QBVnD2l
         UwEdFLQ3w5+KkL4n+jf3gqrNKq2A+ZZXnzJzg/aVJZ5xaKGFC6Nbcgi0Vt9n4XSrc8wq
         Hw4R6cTqzvB7RLRdYCGxsEYtrf/LNmBLbeQf9ke2qgIABOsEotTn/lkkHSLkEzvO24Zn
         jSndAmcl4zIA2aZE7wmRTmgtzZzsYk1C5DDcuXVxkUt/LQaTr3F37fpvlBC4VMqCZ4w0
         386w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837211; x=1772442011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37S+cXhzJ7hIOalSo3T84dnFkx5qpw4OnqKSfI43WtU=;
        b=E5z68fVSxWqsEvKOfaAxs76UGcuIgw6rGsVZCGY3bATbK7pXT0sbY4nynXdg8D74Oy
         OMXeRCKiFHYSN38y2+ksojeZ2iutOtXpg/P7Kv+lxG3E8IdT4+0We177thhAUEMCObiC
         UlLDwjjmTG5KebUf832iqhe10qw8MS5ltGyu2rjeTSfYxw5ZOTUO+IdaosXyjEGRVOm7
         2vm1DsrjHliUUYaN9HW4kf7wuMFQwsnVOV7Tc5JYkKm7D8K6ByQTkGxwdPBDuzOwTnta
         Fm22kJHVgABrt6hhAliyaOyXWsfYt1Z8B0giRMrF19I7XJwCFpGu2o1D87Ijfb5QRZHV
         ARZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGJzL7tsxNqt6bAXiwc69dWh89Bupct3aT/5R84XfmF/J8a5fZa8EWdpDmMd+d4pwei7SOERD2I7RtJCI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxc+ksgPnVGM3rnFyQJSV0EOK46vyJmsR2/gr43vbiBITeUedCb
	EqyrxNDw8DJtJvGI/EMbl8ftz6ah0QL7hSd6uOZgbQySrF5/9xwCkQo+2TDfZksIXQxV5cJjpy7
	NHhgsp48tKPmOpMhsFipuk6r072C7Aj/DX5aiaZB4QGNKBN90zQ0cyAZ8LciGwBpkm5ObdXLId3
	D7
X-Gm-Gg: AZuq6aLI1ZJkIRrHOI8Xkd6Z1A6bYkj99OavsqK99+8JGOPczXReGqvzvc+ls4gGMI/
	JvFFeovrpivYgvJKgMmy1c6zepuZr+UOum261VayMC23xGwn9rsZ4E1n55QcKwegzA5AHkgdxi1
	xlwNuXuqX3GJnxYsuqeOehO7RCQKK1JoOnkWy4pji/uMXi6jvVzp264e4ndl1LbwUD3Tg2G+DoL
	6BSWUls79J5bpphkgqSin3EsDPty4L7jFFFX09cGEhE+7ebqgKyjTHm4xv/+KiK///3XgDYx+xd
	w+c9NS9wTTc9i05dJZeRB2/0Fm1eHRBboLlw+k1VTpY0k8QQhjF+hG060LvApsNP2i21Ct13MWa
	mIvjTlkbZecVRqDYq43ULg4p1j1QBj0ZDwweB3EKzah4Md32yuiZL
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847881585a.64.1771837211293;
        Mon, 23 Feb 2026 01:00:11 -0800 (PST)
X-Received: by 2002:a05:620a:40c4:b0:8cb:1c3a:90f2 with SMTP id af79cd13be357-8cb8ca81f99mr847877485a.64.1771837210797;
        Mon, 23 Feb 2026 01:00:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.01.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:00:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:36 +0100
Subject: [PATCH v2 07/13] i2c: scmi: use i2c_adapter-specific printk
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
Message-Id: <20260223-i2c-printk-helpers-v2-7-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1vPODltnTM4Mj89cEM+Xo4mC22cbE/KV3QxgDL0fRbY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBcDzdqpQoO1qrBXLMBTaUorlyf28sbZOZqxK
 AmDe0QuUlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwXAwAKCRAFnS7L/zaE
 wyA4D/417EoyqI0QBn4m++bexsMnLKIhOgaSKHUlCRm4WI0kBCH7GfKNgK0l6z9SvrOC1PZnQbB
 2l0PDir3Gnpx+UNskCvlxw9rjF3lBGssYYGa3MKV4RYggkAOwBTogDaLDyeI0bJw0LvXF9X5UMi
 V+vzvRzs/8vJXCcpVokzUI94EnTskk137bVDQDWWd94SiFlx30X/cS4x1o9Vz/UwklHpX7qi46E
 yMNQqgYnvg4PEPqi10LUKV10mU+2YEQR9/ooqGMteOJjbvRfb1VP00k9n8PzFzPUzWD9ZLCwHEY
 nnc2ULdIYR8Bcbu+AeD4P6PMQ1BpbGYQESpx7GVIKOdNcQrjnrLJefyJKvRpOuJd8rRujB/CwtA
 wnEutW4GlXh/yMXgnpqnOTzrQfU6hC7HMIhpMXf1sk/2idyYqgV/SqJMfZ+BMajPVIuVxTYglj2
 5euD/Mz1ZAtyF2XuBVL2mdeg3jqXPc9fJfgH6XfViUmnaKHN04uOJXrBeB8PvGFLzomwfyC3lCt
 FyF09qqotF/WPjhL+Xivo9wdFdqRe5pK/YtFHMyqtcZN9lpVIjE5exOQA6Kzr0tFqg05+J4v6xn
 caKJHWeVbnZdXH6hqq7ZJwglqDcAazl9a4qgg++XzUMrHK0w9pnYrkW1ldDjKXJF68OF0Uwgty8
 OqHs2gqY3dCK8tA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TrWKV32JLNVNiF0bAK33n1pnwmD5qEqN
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c171b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=iZeLIxs0cxVxcBwrIEAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: TrWKV32JLNVNiF0bAK33n1pnwmD5qEqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX4tDnw/zlS/GS
 jZu8Oe0EEjv5jyNrMAT1potVy3fvX8f5PdO3oMbK7F3wcvyAwVjko1CdAQ59nM+8qnOIMOVzAan
 ZXxCLyocoSOfQlY3EiVw1UDIq68OikNRpfKwW7toLsO1W3s4xwq7onnEEtiDQZWpb88Thi9e7sW
 XthAdtnN/voUcpduQKzvoKzx3qe8kEzyGY7+lIEehFME7w1hzMVEdl6tLCCJBq4wY1/5q25wL72
 142XX9Qk14odLciqhEIpPIgONYUgPhkFaioB2trh78om/M1Rn2hTW9I6rkaVc6NsIcYF7C6ZmRl
 hBRMYqA9v0AICvixEpFHRlUTsNPlPWWxC5+QsGOt/oI6KEP6aJacq5gwHWeKbRoxB34ExpiMSWD
 /6gD9Pq0iEVjGouQMJyV0vyDyXXOLVlx4SJj5cQPHh1he/phH0gXhPuKvcWpwyPGQ7lncYUtsdi
 YX0PprNJAKSb48gh/EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230080
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
	TAGGED_FROM(0.00)[bounces-17028-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B32BB173672
X-Rspamd-Action: no action

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 324a63efa1ab90027854646f84142f052a966537..57b8175f0fa8da52dd74c5bf8e3059358c033a37 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


