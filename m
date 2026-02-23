Return-Path: <linuxppc-dev+bounces-17021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Fa6DhwXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0B1735F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDM1DsCz3bcf;
	Mon, 23 Feb 2026 20:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837203;
	cv=none; b=F+iUPuM6olHUUQAqgJnyKMQISFW+0JC8IPugA0HWitSC5yiEK693++gPx2lxTgEheS+LZErHXwA3u0NUh3tsnclYchJNzVp6kMg8hIAiCaeNsNIwi4vlZ+vxSun+MhXQvxMceHg3f+KywtYLSnxc7QK2J7Ia977RvyGOYJ3wV3W441Yoo04ekeSfNVaxLr9CmbDAigQaAfqERHG3tYwvSAhN8sbaj7McSP4e17WWJecVzEx3/uW9p7a8bk9mgXM2ar1mUbenIBXoNMupqUTcUFqq4ePxSWJMUq8iaKJidSlHGngR7vR0Ubmb3I6iZQ4GWa2E/iEIDTf+egFzJljYsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837203; c=relaxed/relaxed;
	bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwqibHXdEjp2bttnrZn/IACabpSQXIBEe9bmFSJ+e4Nf1SYIGJqCY+syoiVG5/kaqj1KrLryeB/kHbT4SIUywZUtFt5zSxC3oCQNsV8uJrtPy3MQaVoEyKnsyYMvytnfX1ssBkRpXJN+rh0yeKtECqh7CeViyBO2w81W6IH9VDAi98ADuuoGYm5B3Gnj5YKh2oGbraPmx9wRPmt74kHrB/i7x28FLjLYEczrev5JL4bhMRUKRN3j5lktcYko8fmDVetuRwLj0uWThkG3OBuF3+g8ztU/YuJCf8IWRZRP6K3jbtSRsoAsbUON03HfZYWjuL4+pGxW7bJWw6/LTkU8og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hINeg6LE; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RlYDDr3s; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hINeg6LE;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RlYDDr3s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDK0mBHz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:00:00 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNb2eX3378176
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 08:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=; b=hINeg6LE6NcTI4Ft
	rDmNwKGoUYDv0OLRpTbAcXmLs7YG3fwHy5C6TLgOWGmbUDcQOIdDNMZ8LMbFrx+K
	a/mGVE29+issiAEDumJZ+18H+qFyr8JpvRoHzfiBsmoHGkcqGpeTv9+2KfXvY8ev
	WKLf3G4rXue8CHf/xi6EMzdVcm24ed5OE1gIyUlz5c4h1NO6/B2er7AK5q41G/yB
	C1GV/tJu5f//GI1GOFCp7Fvrbw2Q1u2WBxs7NzZgxqeZ3/VPU+vZV/Ub/dKGmw9p
	YEK6QlzF/gSQaCndppVGGBQKWYVjLhxKJf2KBBT6di86iEhMRMbv9OWH3NZVQFkA
	2vtzGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk404f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 08:59:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so5265761085a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837198; x=1772441998; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=;
        b=RlYDDr3sGjQbsuZmUpq0A9PQMOTHRcHlXAoZ1SajdAdkpkcOFyMJd6gj4/E0DiamgM
         q0s0J2Yc0E7ku0taZ8hJB3wAVuFCGYdjjKWzCFJAvNY3zBMN8yTeK1f5M03kcR8udvzr
         ojDfkHIE+fgkmM4otBxKR8tUJ9UbT0jIbC+FY48JMhLz78TNSZ+5AV1cbO3OP3J+oLA+
         /H3mtsqW5DUoUvPssg0vBT/qKmK8bQaQdZ+dMELOEh/HYJD7naf0QW+kt4Lpin6MYni3
         bzK18BywDWm3P/EyVaogofEv6Iq6miMiakm2M2IXd7JBGL2jYeJ4VDQM0fe3OS3tq3S8
         1Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837198; x=1772441998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxUZab8aMhubY0N1zDEDqUt6vuYQLsqiJEVvXqBNr/Y=;
        b=Jaz6MwyjL/9uwsEBH9ftRo9+jhbiz6KvtxBabzysQxjD4dXlZ/YFJ5MAcqVafrFFJ7
         hHq2S6R1Eg7/R27auvxSscRcVGUPpCkvxsIKCyD+zurImuCAwyssAu71LCMFcQksw7jO
         EEw3keiJfVOvFw5keRsjIMJuhsqeELj3mIy1I9uR2woRJCldxDW9Ml5pIAHmJqAX/itb
         NZvOs0o3FgMRQ9rfPNy6aIViYc8+TFqAUsLdLiyOUXZk8MGtjjwytaB8vP0ESVN9SZJv
         cNyKYIxg2fSImoIoueMJE4O2CWd77U7FcHEDXF17j9PwzO/LqBfGTQdxSGNSzIXukbCt
         eU6A==
X-Forwarded-Encrypted: i=1; AJvYcCUwwjXL+tgzhiN5ea30bRJrId1VNfIaGZJm+0/MWTo9wORjFpzmwfLU596dDbkFPUBePD0uJ2fU++rfznk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yws8wX5568EPFpsLpqyJwbGT0qS85DqooHJzEtWtuJDPqQiRuGS
	yNSK+0EfReEWe31UqLj/Sppjz/2+S/W4GL0q9F4fijAFI/+phcyn+FX8/vLAMGoZeRnv62fpoGf
	oiQI3oVcoDatjZJ5oiEdT8cnvd0f1CTbBMyvx51e9snhVdMIaH/KK/f04sksQeF/qeKdNV8nkTK
	79
X-Gm-Gg: AZuq6aL8zGCTRGbya3q7KIHgdyoKFs4Rc212TzUynlH2icfVs/RnjuZhlqiyFw1DXjX
	KwLNen8488Y5ETq6YUZa8tlCDmMTwvvzAi+6ieRJKTeHucotvrVXNQuvUnw3MrJcfFrOYThQNhK
	ZhxVf1eMWZgKY8XreovKHnX7nubHybbTnm2fc2pm5o9k6CLGB4e2vf45hv/yDmXZW4isNgsI3JM
	xBPIzxAapLWpmmhbbpNSR1MXb+tyKplcEEfnZC5/jmvHg4ESAFwNLhEOtHD+/ZSJnmiaiB3hHMz
	08o+5hBNNBoyQMz5LV2eQXiCdie+LZphPtuZG8Q9lTFxlo6EJps4+UmOS/xy1VGv4DxBZ8WVgz3
	sIrjj5saHY+kQOpLU1Ub9ECes6D5ccStoACRDLupBWlu3mF5CF0YL
X-Received: by 2002:a05:620a:480e:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cb7bfc91a4mr1729666085a.26.1771837197554;
        Mon, 23 Feb 2026 00:59:57 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:8cb:df8:e86c with SMTP id af79cd13be357-8cb7bfc91a4mr1729664085a.26.1771837197127;
        Mon, 23 Feb 2026 00:59:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:30 +0100
Subject: [PATCH v2 01/13] media: saa7134: rename i2c_dbg() to
 saa7134_i2c_dbg()
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
Message-Id: <20260223-i2c-printk-helpers-v2-1-13b2a97762af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YqeGgXpqldMF8HxKB3uKGoGgFOzgL8+ZDrJlc8jiAJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb8OHlHHDWBSO8ZFzntsN3xbV7ZeexU+rxfg
 feCDFo3zIuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/AAKCRAFnS7L/zaE
 w3SRD/9kRjMgv00rIPHPHM9uZeGcfzBrrOW3e2CjD/Ba6V/M4ZeVfvzifGy9uG7Vo/bj4qrB5Eh
 vRIG6Ao9+a27vcLckM9zoaEffZgVxG8fjAntZaP7dxUhuj1kZpbOzuTQUFdstBpoJEQi3qx4s8t
 DVAvP9ZAZuPi5nyhg8sMTkXtV7OU1arFsbqNo5TJysZEiYHPwJRhTDK0pNzaApbkb7c4FUOLPhZ
 pYac4xlu0gK26Mf838V0KKmAZfkEFFb/MVFPWp51PKH+wP3pALiK1F+A/hN1PbkdVRDlsP2865t
 qfJzYUOuUzhyA3R1so7E6axACC311B1Ll1LGcU9uyUgtREDMDIhbKDN1cM9kcE6Df8Ki/FRgKf2
 5Bjboe7TjXXo/Kkjlx5I/HGCQrZjt4NkXOv1HNF3MhUfbZdymKm6xY4OYBTH7/a6SGguwuwL6bq
 bsUVAFIId7KTsCgpdVqxHHkHgzwHz+PQ3cyeNUDuhp1HCp82oAPOfRPLn3pAFFBpzog1PolQn4U
 fZ+UcPxnqCDy5uscllfkBC9sgnHoVrtcDtV1MjdlWQg2SZgc9ws3/oRzapN+w6NcQYHbRZ7rcrP
 taQSy/k5L9uCdRHDWd1dUOtlH8kkAanoWkUICVRJcSEonJfZRA/pCuZu6B9qVyReTmNnMMymi5D
 84Ah+S6uwmFMyAQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c170e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=LDBv8-xUAAAA:8
 a=EUspDBNiAAAA:8 a=dK0ov3_ljch-J7--2m4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX2Oksuz4Cz8MG
 qJXA57ozBfnIzzdzWCZ7SInKnCjxq+feawol7IpRFqFiwSxMAul9l35spvH3D4zlN413XgSj5gZ
 ubDrnHq4J2q+GqFnavObWpqi+PC3ugIVl1kKSJjDlk+NRxbVqu6HhCKiNQdzCIwJ+rnc+9ONO8c
 teecE7DeWublFf5OPy4Zqa31lxFjbc5DVMwNQGd2LtlE1vP1d+Zlq3jXVACxt5bV0MT997fctzK
 +ucaegYMcQFTz6kwKiUC95romzxnQ94+FzKOiV+j5Gba7g+pFY6IXYWiwNawJHnp648gsHM8nFl
 qeP0TbzzmaufNpEGlql1ktukVsXHJR/KfYTSg5So3kZhvMCaX3ETL7W1NcL875ZgfJAHZOtkyMO
 xmioL+MO/0OQv2jzXJBMeq5pzKHVDbPqQ/4tgOyqCZdnIesHF2i+Uants8fXIiU4iJrqk4K95U7
 XqIUV1v/c+QTwHXLkqw==
X-Proofpoint-ORIG-GUID: glE441XoaPdip2TZBgjuwsgixesNJhdL
X-Proofpoint-GUID: glE441XoaPdip2TZBgjuwsgixesNJhdL
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
	TAGGED_FROM(0.00)[bounces-17021-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 39B0B1735F0
X-Rspamd-Action: no action

Ahead of introducing I2C-adapter-specific printk() helpers, preemptively
avoid a conflict with the upcoming i2c_dbg() and rename the local macro
in the saa7134 driver to saa7134_i2c_dbg().

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134-i2c.c b/drivers/media/pci/saa7134/saa7134-i2c.c
index 04e85765373ecc0f0759eba539c20bcdc9716ca8..1164e91cbb7b7f5250dc02bc086f5cc06ea8f5a5 100644
--- a/drivers/media/pci/saa7134/saa7134-i2c.c
+++ b/drivers/media/pci/saa7134/saa7134-i2c.c
@@ -28,7 +28,7 @@ static unsigned int i2c_scan;
 module_param(i2c_scan, int, 0444);
 MODULE_PARM_DESC(i2c_scan,"scan i2c bus at insmod time");
 
-#define i2c_dbg(level, fmt, arg...) do { \
+#define saa7134_i2c_dbg(level, fmt, arg...) do { \
 	if (i2c_debug == level) \
 		printk(KERN_DEBUG pr_fmt("i2c: " fmt), ## arg); \
 	} while (0)
@@ -84,20 +84,20 @@ static inline enum i2c_status i2c_get_status(struct saa7134_dev *dev)
 	enum i2c_status status;
 
 	status = saa_readb(SAA7134_I2C_ATTR_STATUS) & 0x0f;
-	i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat <= %s\n", str_i2c_status[status]);
 	return status;
 }
 
 static inline void i2c_set_status(struct saa7134_dev *dev,
 				  enum i2c_status status)
 {
-	i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
+	saa7134_i2c_dbg(2, "i2c stat => %s\n", str_i2c_status[status]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0x0f,status);
 }
 
 static inline void i2c_set_attr(struct saa7134_dev *dev, enum i2c_attr attr)
 {
-	i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
+	saa7134_i2c_dbg(2, "i2c attr => %s\n", str_i2c_attr[attr]);
 	saa_andorb(SAA7134_I2C_ATTR_STATUS,0xc0,attr << 6);
 }
 
@@ -160,7 +160,7 @@ static int i2c_reset(struct saa7134_dev *dev)
 	enum i2c_status status;
 	int count;
 
-	i2c_dbg(2, "i2c reset\n");
+	saa7134_i2c_dbg(2, "i2c reset\n");
 	status = i2c_get_status(dev);
 	if (!i2c_is_error(status))
 		return true;
@@ -198,7 +198,7 @@ static inline int i2c_send_byte(struct saa7134_dev *dev,
 //	dword |= 0x40 << 16;  /* 400 kHz */
 	dword |= 0xf0 << 24;
 	saa_writel(SAA7134_I2C_ATTR_STATUS >> 2, dword);
-	i2c_dbg(2, "i2c data => 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data => 0x%x\n", data);
 
 	if (!i2c_is_busy_wait(dev))
 		return -EIO;
@@ -220,7 +220,7 @@ static inline int i2c_recv_byte(struct saa7134_dev *dev)
 	if (i2c_is_error(status))
 		return -EIO;
 	data = saa_readb(SAA7134_I2C_DATA);
-	i2c_dbg(2, "i2c data <= 0x%x\n", data);
+	saa7134_i2c_dbg(2, "i2c data <= 0x%x\n", data);
 	return data;
 }
 
@@ -237,12 +237,12 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		if (!i2c_reset(dev))
 			return -EIO;
 
-	i2c_dbg(2, "start xfer\n");
-	i2c_dbg(1, "i2c xfer:");
+	saa7134_i2c_dbg(2, "start xfer\n");
+	saa7134_i2c_dbg(1, "i2c xfer:");
 	for (i = 0; i < num; i++) {
 		if (!(msgs[i].flags & I2C_M_NOSTART) || 0 == i) {
 			/* send address */
-			i2c_dbg(2, "send address\n");
+			saa7134_i2c_dbg(2, "send address\n");
 			addr  = msgs[i].addr << 1;
 			if (msgs[i].flags & I2C_M_RD)
 				addr |= 1;
@@ -265,7 +265,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 		}
 		if (msgs[i].flags & I2C_M_RD) {
 			/* read bytes */
-			i2c_dbg(2, "read bytes\n");
+			saa7134_i2c_dbg(2, "read bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				i2c_cont(1, " =");
 				rc = i2c_recv_byte(dev);
@@ -286,7 +286,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		} else {
 			/* write bytes */
-			i2c_dbg(2, "write bytes\n");
+			saa7134_i2c_dbg(2, "write bytes\n");
 			for (byte = 0; byte < msgs[i].len; byte++) {
 				data = msgs[i].buf[byte];
 				i2c_cont(1, " %02x", data);
@@ -296,7 +296,7 @@ static int saa7134_i2c_xfer(struct i2c_adapter *i2c_adap,
 			}
 		}
 	}
-	i2c_dbg(2, "xfer done\n");
+	saa7134_i2c_dbg(2, "xfer done\n");
 	i2c_cont(1, " >");
 	i2c_set_attr(dev,STOP);
 	rc = -EIO;

-- 
2.47.3


