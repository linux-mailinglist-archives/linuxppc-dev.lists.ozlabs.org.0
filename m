Return-Path: <linuxppc-dev+bounces-17023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEtMIB4XnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17023-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A6B1735FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:00:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFDN01qJz3blq;
	Mon, 23 Feb 2026 20:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837203;
	cv=none; b=o1W8boq/4+uzlS3msIhzG3j/S/+tS+FqqiuY6cACSSgMVTJU18f3Ek6r4pjYKRe33nroh42sF/OAayIA72Bl7SUdh9LUhWQplZ8ND5Mwfe9l8gk+VvWmhICIYIt8c+TymIaWT3bzD/Yck6hVA418d0T1z5vQQ0NbU9Xzlb9PcNalo1nwBh51kjW27YKP0wx6ZbLfrReWmnrWxcJ83sj/heeXa6KZ+aDBwdvb5o35tVToYy+xR+nCZ5WzR5+wMBP5pFJ7iXD8g0OBgYw0DApX0TVsRR8X/SrL/0vIRRdFIHn3KqdhlYoUPYLxbTmtrTmAC8GmmBZjFJsvoFhD8XENeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837203; c=relaxed/relaxed;
	bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TsyNaLpq6i11+DQVuQyhXQKgg7M7w4uOIJTfCItrTxqC8W5G8A6cSUs1q95lwmlLDRCYiF7KohS+uPYoFb2U0Tt1LrBjj84QROCJyprIk1AXsU6qo4+pGO2xo/hlvmsso5IslgFAAvjQVUKlD+pTP2rZ1wbGiswgMVupeckyzBFXRMzYNlSNnYppMe6fPwDDgVYFPD9yhkGd3nBbafELTVgL83YMkezTMHymRC4s8QD9NoFWz1K6jWDXXNkQQL0/UYF3SlgWIIoL0IzK+5NnFgQik7+VyyT5205YLIG18sIj+QbMzZ8h0gkUI/Bi9vmD8bdNU8v5bpOfxWT0W7mA+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUNbRl25; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBEUFu07; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUNbRl25;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VBEUFu07;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFDK0q4Fz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 19:59:59 +1100 (AEDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N0PJng3473716
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 08:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vu5+kJ2KRuf7XSsncM4pNa
	9NRUl8nXTqYbQMD7by2WA=; b=MUNbRl25lBIHci1Gq/e9uHk5NhTxlNl79mdEHB
	1cSDlPuuGnAnkHmC0IHYcUqv+QpAP6GXMi5LcVqoTpoVKq4QwHNHetp2B91OClcS
	zlcvILeVHzqnqdfGlHwT8h3RJKjPNqxArJNPkDmyScBEApiy2yExu4GULqaSjaXw
	Hr9SXir1O/GPsXkzaD1fjEij4E6DQAMibiBnHaH3B5ief0r2ln3o/gj7O0hCIQLX
	bQjClLu8SpDoHswJldsRNcdrxbKnXuOmOkcXgyNToXDEW9wI733h3eHYjgqloHjJ
	1Ax+P6g8Dhiq2A1Ehcf+DcyMqBLeGME2L6w2UT1TZtJhCEig==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wk4047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 08:59:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so3435681885a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 00:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837196; x=1772441996; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=VBEUFu070X4uCB8pfrwPxbJ4MwkHHeKfp0g6SYn9C8q2t4vqgKAlDZHP9Ad5hVp3hK
         Hw/yTyRd3LKlk7A3K/nEw6kandaYXMPufwWHUPXxLvEFEK+8jBdzheJHKBj9Higyng+E
         7ytzikB9QdVVFfcqKgwNT0tx/sFoogXyKO2CNFD7gdPhCDZkv+Tklw17qr1jDQFB7HwG
         736+eKlSG1ihEJhpM1VuPignquTaQmxrO4lMRubOKOW8P6fygluQqXrgllYkyKcL8BRr
         XCsky9j2Lk1i2u1UValuWiTY33S7O94l8hmMNs3nIdFDOP7ocHsWZGCGRvueXb5/VPWm
         eE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837196; x=1772441996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu5+kJ2KRuf7XSsncM4pNa9NRUl8nXTqYbQMD7by2WA=;
        b=miJpHh7TluvzrYvpHpoN+l98fDjSvC0KByenCoLU6KYh+WlTKI17bmsQg6acVThe2a
         Do8dtluFvVkt2JcJOUItOksMgCwEzwxF9AUAJWiBpVNrEhLhbUzja+dvcTaAJqehU7PF
         +l5LHGJfN22q/NtqeEJ0FC2fh14OI15FKNt0i6Qyt+bpPFTFCOSIXvEKfFt8GaSoP20S
         EKWgZjd7migmi3XypE7+X1uSOSsRtajNd5ecEkXoahzRlPeiMTFZc5Hvhmlg/w9DXQIO
         gT760M6z4G9SM1rYjT3q3jt8T92qawMMcuTWxsVeP4mkfKHk7ARyyYGBxldKNqtgORvy
         t3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWm75CvbxfaDo3qh81e6kBD3flJygfpo3JRe6CHxC5uIIaU9faiXtfgCzAxyo8JAxcbffQ2fd9Q7EzpX8E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYVzjZOWvEw2a/Rd1YwN8yxk/RgzXbgEWepxI3xwk0IQPt6uMf
	BYyMwLgpIpnZI0GQGO2ctBJAW22fiRgKj/s2L2TrDUHEXcWFN2ChhCZQNeftFQBWCNuVU+PGwul
	I8wkPBEjWEC2xzfIG2Ar1vuMYnNvN9oym+MqaStFCOn+RxBBCiXN8tjO5LzkI6QlR348AKYC+qA
	IP
X-Gm-Gg: AZuq6aJ1RVYK3Sf+GReAj8tP8yXF/U746JzanZsQOzSJ6QHAoLQ0OoBE0D+E9oY8Sf+
	oQB6BKQ5f7PywxlXzKQI3scxu2+qtw8KcKkXayV44GPCIG70d625uQaTRhYeORezwDb3LcYaBhL
	I/9qF6Ygjo9hdNhMIw6oGmgRsWsl154Yzq3Vy0KmJJtYCZ28iGEWZ4ZKQvmkTNubhNn0fb4Sv6n
	NGMMnUBDSG35bOw5BgCTwlWZxfCnIM2zRRB9jva7B858vQF470YkK8F9s/a86/coYIRJLCyxkvA
	qbFxXqTlxrILn/IZkA+eytKSEsQNqigzXqLbga3hkazzqPMpcy0OYuMT6ifJVSFBrJIsXaYKIfN
	TEnalglLTAjUzbznkAdv5co+8EtgmsooX1uP4B5VO6bqaWMLwVzUY
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899730685a.8.1771837195593;
        Mon, 23 Feb 2026 00:59:55 -0800 (PST)
X-Received: by 2002:a05:620a:4416:b0:8b2:1ee9:dcfb with SMTP id af79cd13be357-8cb8c9cdeeemr899726685a.8.1771837194998;
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Date: Mon, 23 Feb 2026 09:59:29 +0100
Message-Id: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPIWnGkC/22NSw6CQBBEr0J6bZOhQfysvIdhMY6NdAQGp5FoC
 Hd3JHHnppJXSb2aQTkIKxyTGQJPouL7CLRJwDW2vzHKNTKQoW1GRCjkcAjSj3dsuB04KNryUBe
 FyZ3dGYjDIXAtr1V6riI3oqMP7/Vjyr7tT5f/000ZGixKa/a5KW19vZy8avp42tb5rktjQLUsy
 we7dqc7uwAAAA==
X-Change-ID: 20251222-i2c-printk-helpers-a69f4403ca70
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VvG7vd7fZWSAXv6PdVUXds74cvD+b0T6Unx7PuBmRnc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb3fG3CwNJ5M/hqqSYT43XI8trsoU1YEeWt3
 Kxjocc+Vx+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW9wAKCRAFnS7L/zaE
 wxkpD/9RhvfJv3ttEDXAr5ioS+xTqbBT/5fiaxaSwFIZeJ2gZR91bPruhA+1jSyV0rb7iB3dp1x
 hnZGjJ9fxV1Fy4Vhf9la6j6kbkt2byhBaua8B1h27CzDQZxi9LLUHYTUH/AegRw5GVtSv8dmybn
 daYh1LYZItCUKjucKFGeNH3zJMeWpnpa9qhYjq6AWFWCf68SetWMt7/lFDnG10eh5NAcMjT2H3m
 EoAu/D7sLQ8ADCiFNVux65KSZZ2jMTuDOWQ2haWCJjWO+1bNrNtFn7Pb7aAivIWnLRfck9mmH6i
 EgXwBu+yuO0s3JIDAvdDr0iCt4J0xkXCidF15elPYth67L1H1GwbsMStuSvY4t/jryayd8jY/x0
 Ruab1IgXtRrRFwfIWjsjTXkTkXMKKE0IgtIquSB2KQMHQFpEF7HGCilnjRVAT19GvwLVaYHWMh6
 VG24DSSR+aen7xI/S23yArfiEaEBiIPn8s54a0BCIkKQdWQ177nIgKDDS20LekvqZFwQoZeqC00
 bJ/VAJrP6jOqL0pKu+2XLbv3Em2SMjZ8VXGMKj6Y4NKkmDmE9B+V00GpZM/S/nuwfStzjF1+nqj
 gGn8Hon0035YW5EZRHQvYVWhqQxv6ThLBvqaN2lA60105wjKRVxQ3cl5rvHVmwmTgCjqSjzhTIO
 KwabIv/iYhBFs+g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=699c170c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfXzHkaPaBJzmRl
 CCG+SPuxIK7bAqcCafmE1V/zDM+KMN1hQR40FCkD9768LbjIGFCCsGDKgVhJVfGYlm5xEueMV2p
 Wgfg6g88QRO/FHe1FUGdD7yfTslw1804oU4Jfce3sAm5wQXRyNt8BSmR3MihSTEab2mWJ1M/jEX
 jYXhcgrWGjVOGLemvW+0iQTDomraEaHHKUEUcWD1GncXxNWZvwWw3zYJmew/ht0tcJT0wlWhWeJ
 64GymlKQcOnUnnMN/L9PmQPt8+enZYmqV8H5+BFyHW4CMpt2k70xgD4a03HFR5br7ALjh5z8nrt
 PW0VhYnAwXoya42vlJO4bOaa1uejwx02MrrFh42S+ozQELVrJb9UABKLzugxF8yC+p/ggvKtcAr
 NdHomkb3IVwGroFK0aKp6sFSDt0I8dF/2zm0i8seDusVCt8Cd8P/qDm1y8OwD7JEo+Bu8PgrBX8
 WUZ0+FG9xzvqaYekCdw==
X-Proofpoint-ORIG-GUID: T8Wz5PMgOOgtFwSYBVLXd42Lt-3SxRWW
X-Proofpoint-GUID: T8Wz5PMgOOgtFwSYBVLXd42Lt-3SxRWW
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
	TAGGED_FROM(0.00)[bounces-17023-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: C8A6B1735FE
X-Rspamd-Action: no action

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in device printk() helpers
(dev_err() et al). It introduces a set of i2c-specific helpers and
starts using them across bus drivers. For now just 12 patches but I'll
keep on doing it if these get accepted. Once these get upstream for
v6.20/7.0, we'll be able to also start converting i2c drivers outside of
drivers/i2c/.

Link: [1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add a patch renaming an existing i2c_dbg() macro in a media driver
- Link to v1: https://lore.kernel.org/r/20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com

---
Bartosz Golaszewski (13):
      media: saa7134: rename i2c_dbg() to saa7134_i2c_dbg()
      i2c: add i2c_adapter-specific printk helpers
      i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
      i2c: mlxbf: use i2c_adapter-specific printk helpers
      i2c: isch: use i2c_adapter-specific printk helpers
      i2c: ali1535: use i2c_adapter-specific printk helpers
      i2c: scmi: use i2c_adapter-specific printk helpers
      i2c: ali15x3: use i2c_adapter-specific printk helpers
      i2c: powermac: use i2c_adapter-specific printk helpers
      i2c: owl: use i2c_adapter-specific printk helpers
      i2c: nforce2: use i2c_adapter-specific printk helpers
      i2c: amd756: use i2c_adapter-specific printk helpers
      i2c: piix4: use i2c_adapter-specific printk helpers

 drivers/i2c/busses/i2c-ali1535.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c        | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c         | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c           | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c          | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c        | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c            |  4 ++--
 drivers/i2c/busses/i2c-piix4.c          |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c       | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c           |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c     |  8 ++++----
 drivers/media/pci/saa7134/saa7134-i2c.c | 26 +++++++++++++-------------
 include/linux/i2c.h                     |  6 ++++++
 13 files changed, 109 insertions(+), 104 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


