Return-Path: <linuxppc-dev+bounces-17022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP1PMhoXnGkq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF21735E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDM4GDJz3bfV;
	Mon, 23 Feb 2026 20:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837203;
	cv=none; b=gFue+M3nMIN9iVTB9gG/FqSe5z+lO04V8vIhpMQ5UWxedJKcc9QuOVX3e7KV2zacUoCnA4YR41CPOJmyaUoTppqdnv0r/yw3+iD8suY7WI7ktoqrw/69fHedg4gR0DgXOnXbf5pZn0JjkVWcUFzHpy2GknZEpKecCy8PI84yLsL6725ppv5dCLiBoVMMZxzin7bSJBhKrmlBeH6r/t7E3KTf1RwbUARL/cp9qmwHkIug8RHybLn2T3rFXvK69j0oDNmTPem2UdbQFPOinYxCkrvWAtZfdtykJjxPeXexraxbwGZulfg5p7wjeWmJe5Rk3LrvxFBbJpv4PZ9Mlbh3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837203; c=relaxed/relaxed;
	bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCqwfDI3sD644CYHH0GMW2Gx9avUqtFlTeobYGab11I6SNiZ+6O1t1bhp5OUZfC89XkO1dIatjSihAkER6Au1JcTA/feTDqILZwcvVWSJ2UmvGgah6JaueL6xnjo14EWrB0OUtPgqLRYTYMXQe6+WDbB7EAq/k/TK9cRjUvQwAuICULONB559bsjvZcndUXUhp2Wi3BG48nSCSMM1IiE2z0ahgT+Ptb6suff/XL6uHuGIIWuqwEx552XxUNq6snb1wYNoR1FBWVDVzXTxPkSbu85JFNrCCkZcKyVhOmH21jgcLrIOwDf9TOMn59duwLx7a49HfS6qj95Ny3L8UAJGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cws0ECAb; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9sY9yKp; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cws0ECAb;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z9sY9yKp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDL5D8Pz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:02 +1100 (AEDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MKkV8T2240014
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=cws0ECAbBSCqE6iv
	a8QGmcMF0cnSH9ehxsknG6A2aDPtW9cHO2uem4vDvgFFF66/ZsfJ6uAfEyYz8gKJ
	QgUytz7Is8SH+AYe7IDBTZtKQUD0JgXcLmrmE/5dz2mpGDRr5VRvkRo/BTkDLKbB
	yNLoGtFhMEe8Pk1Se6WZRzgZzWmQGRltuRYozmE8npfyDtPHiJziFtQJIbrRKKoF
	ms+KDNJSiEhZxrZsBunwaUbxpI7XhCsOpb1uMaQWCtqZYLpVBeG3pmO5bko5wgvi
	zZI2B9N51LdwSt+hLE1+CBB1nq3YiKOgt/QyKM8c4VkbuzHoCMyf8gLqO/n7HiI6
	kHp35A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wyv1pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:00:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71500f274so460225285a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837200; x=1772442000; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=Z9sY9yKpmi9xnhOiYCxT3/1ul8eBf53+7DfAzWQaeHWD1YjDgx7yTZF3u+7tcxQLQg
         EVigAblrovKIaxeP10IHebVcUUIAmFkjOqfemwsDzs+uk73kO5+XviXiWaDk70/bDuBP
         5jx/919VltL5eyNJfT0DuTEIXq6hKyxXTJbc7Kfwrdwltk0R7uuR4sUy9HljbQ7zyWCJ
         UGVZkDu64ix/kgRKk5KKz0i4H/5sOMfVruVBC1kODyYnfIJkxF4BHEdtEP6WQqlcaM00
         hbll8rM/jDIGXft1TquHKvGuPHoDsrm95XZTuEUrMjQnNFtrjraxFOiwTEi/mwrML8aV
         hioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837200; x=1772442000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=l2qFn2ctcHvWr6PvukQ2ltcCTmp6GGMybHNLEfojDL8bJPJFTgVmXd7nMiwzcALECq
         inBD8vYkIOL9XReRb65TBiWx70uDb08wTQekf03gob89klL2fEukOswwOxXZsow0j6S/
         dvrGpaHIBOG1hx6Absg7l0QKaw4rorpDYRe/mb9HJ9jT60rgPdErGTp1iCbBoHSf7NFR
         xHNcdS+UuQbQAAIb3DTDvO8v7D7CuR5OLAb2WFId4xBaHt3Q14B+zQ85CoquuK+D0DgP
         OIFvfZQssKp+8SmmuqvFYztx8CkPYG6gcz36ESq0hwStPRbRd9GwkwKIvMicoI1ezYyq
         DbUw==
X-Forwarded-Encrypted: i=1; AJvYcCVZB0PKrax0aqpYv33GS3orfQee6dTI0bZuSBkDY0W4xSHvNbXP2trVJoliu5EWO7Y+JYWuOxBwyUxOgns=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaiOLuvn9XzxSCYTmaBGqDG9XfMo+jRNkpC/xbbMh6dBxoTuUf
	crUIhaARtdn8zzVmRP3+7m1Vv1M4D6xSvBm2hH0m+r5zBuk6x/ddiYFSnIcVkhhz+um5OAIEOQ5
	KmCNILSoaSyVIV5x+YpKQZCqt9CELNXdbp/6zROsr6ajA2NrCxjKpNRAQoe9pT5LlbbGJ7LIeHC
	Ue
X-Gm-Gg: AZuq6aKF4+/ZyXpErIPcsaxqcjXxAPwiNCkH90FO9wRO59THhzEvBxLeD7D/HPmY55x
	ntbSQqXdZbAvJwrQlpUQ+tpbWEJR6NAcqvUAQcx9ECE2RSk59OUwSlZarnieNFp5hLmSX4iOThH
	o609FpAisvqSkWJnXoOVJukN1LIkiX15Iq+Omy25C4GY+u8roYVH4WP53L/wE6ReGVDgR0MeFi3
	iKVF15YivH6xikO5lMN8m5zbu93eM7vJ8d0q6Qf17TcLC6CajK2AvwINS9qkRE19kED+3ZEdwFt
	jpSQ4i0icSS/3Dx9H+9UxP7WRvCES7WtMw2xeVk4XhYOwf9HUBuNSYz2w0UIdCnbhFRp9hSGicI
	KKdsfsfL9pkSAXFphc8mcIxv4n4a6BpYL/EccoXNk2r3/xWETPU7s
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970848285a.52.1771837199583;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970846885a.52.1771837199129;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:31 +0100
Subject: [PATCH v2 02/13] i2c: add i2c_adapter-specific printk helpers
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
Message-Id: <20260223-i2c-printk-helpers-v2-2-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb9jzjFTJdq3M6FO7EYY2QiwT8GVE9qmSWuz
 3ohkzvQSVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/QAKCRAFnS7L/zaE
 w8BmEACrMBvc0WtZJaG8d5jaaStBPDhB6rA1XzsrpvPKTzprO3pfbK0+LDvt2i6hcSz6G/sATKM
 4wmqFf/XEdRLWL54Vwi3cecAtJ8tkTh2p8nA6YHe87diSRhjKjFAv216+yDh0QLuwHOYhUjqM08
 f5kZhLL3dJ4hDRd49MZkT6LGkkFA56GIxx/wOQhMg9FsMGQSnm5tJW4wBUy2F4ldoKdRK3r4eF6
 STm5Z0uulFjPHiAlQ7n/ZGdGSFI/mKQe26GVRiSUTzgHepT6OoK69CwEU6WRm6JdvHpE804SJhS
 6ps8EJHVXUT89mV3+Gbyzz7UtIrFymORTZoy4pq0S5Ari/vp1uOMfyqvRJ0n5OO2oDbe0DiofMd
 L8e6e0NWZ1LU0AHDQ5EFb2rh0u5gom9/cz0WAQ9mGcMdru5aLcsCPFXKFd2aVeRHRskvjca97bk
 pCQ22fRInNk9I9PZzhCx2dLcEUE6ogUyuzOB6bVMFnmtHa6dx99uirWBGGqvzgyIbSqsNGwnXic
 GLik9Q5xUP0W1vpKN6XCwLXHgHleEtmYCyp1FnncRrxB6TxXUTsMd2PluQIrapHsp9Ty4zItN9D
 /wRIDRb0bAFp0WUToMEZ5+f+zdAf3iI9Nl8IyXV7G01Gf2FT7qaKyY93dG3gdHrAKTMSNLB400a
 XLWKVbwUcAwCgXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXyOXVDFlV3ZXU
 njwmDC6+m4GZJT74m8FJB9/xtPI5lhBT1UItI265R50hhD1mGNCtu/8D71KtY1SoAmG61oJNoMR
 j3ppi067qUUbNBR3qJJnOBIe1y4iPproXw8MTVAQVn3zQewJYKwAk30Hpz/BwNlqLMUx3uTSMGY
 cOLLQYDiMSPBDzf0myHyVBiXZWHo8f5f0EU0LwQ695ciPKBhFM+s5Tz7QFTKBqO+XFHAj3wt8j8
 zMPust9IywXp6iMUXVJEqB0gDQyfPfsWygzOctaAlvHgu3f6TB1oaRvB/73IScX16/6o3dYVZdw
 4Svo+mXFTuNZK2D64+lxOuLsjZ0wGfSfZrWBjqK9E29sT+iJtb/9c9K0ZaO4ogscjaZSFq1wBD2
 IdOJLRZRACm24VJYf727oKdDL7ZxGz2Yv8xIRPesb6KG8UupQA5BzzOKML++rwBky8Oo0LGM1Gf
 S2ypnKaZdezFo6SQbEw==
X-Authority-Analysis: v=2.4 cv=UO/Q3Sfy c=1 sm=1 tr=0 ts=699c1710 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Mej1cwQmEQld3_QyuVNBZFxsNBIIPb9r
X-Proofpoint-ORIG-GUID: Mej1cwQmEQld3_QyuVNBZFxsNBIIPb9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17022-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[sang-engineering.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 22FF21735E9
X-Rspamd-Action: no action

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


