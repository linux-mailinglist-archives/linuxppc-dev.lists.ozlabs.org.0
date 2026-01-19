Return-Path: <linuxppc-dev+bounces-15962-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D40D3A557
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 11:40:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvn6Y6rnlz2yql;
	Mon, 19 Jan 2026 21:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768819237;
	cv=none; b=gs1uHsQlFijxx9P9BkvU2pYTzKcq/BeiVGq/s55Pai3Ww/cAsYYCltsQas2fNg/DfILRP62JV4f2AA13X4RonAUOt6Lh7fI55VMWa/u3TP5QZlxcFvHi4mrqp9t16kIASlTgfIPyHyLR1eyCmZp7ga9NveOJa089jjY5EYR0Z+FOQ98MeUtDf5RjWwk5eczAXWMZ7t/mM7tCdTsviFemJgdRX5EGDwBwIJ/gGCOH7WNS+hlVxL8lbNBL4xZz4uoPIm+KVQBEW69bHzWaWCRJM9pgmhqvZNZrSjk/RZPFFhNWJIexxJ7C2PDrseYKh3t1ZwNn2xz1mCHoXM+1Lqq+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768819237; c=relaxed/relaxed;
	bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LkWEQTqDIYIkLLMw6rlKXzrEntF1VCECn4XRmbJBaGkZ0y7RR7tNy1TCAQ3xjXXJeLfkpoRezYQTBSX+zRAcyhkO8xFq8QhV2wDvFeY0ab6OS/PdZQ2THhmXv6c3ebxqS1UzoMdUL+oanxC4lUbE9+9KAR98kBDxs8rY4qRRWw933tacG8w9sM3dUCg8F+tF1Q2WM/kCZMgUtMIuRWq9KOTFhWfRsxbbkEZRjGc2AOZjZ34zn6Xjjis456ZEAJzIEZeG2wgEgFpiAvU+YZAAk+FMCco+o1sYw2+joikhSpJCEr0WsxDCReT2zRgbKpu6Y7OFefY+xEbho3tNtEjGnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ex9yCai2; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAqJsN2w; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ex9yCai2;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FAqJsN2w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=bartosz.golaszewski@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvn6X5gRyz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 21:40:35 +1100 (AEDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wMs1044147
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUfXZM6AiYyNqMON5WUuZG
	EUwe4BPoqrVV35Lqaruik=; b=ex9yCai2MfTnTplGDoXVqEhON42NGGCsaM4L6G
	mCHZ18c0KyV+mODSNZn3WmtdGsTLrOfmUaCU+NhXkG7X1eTSsNf/TtTdzYdEjXzQ
	Cdzz4Zj0SptSY2ZeLLvvTxc76yzXYdqBmCi+5asKx3kclqx6TGxGzS59kfbnW2hT
	zGclV3ubYq8Vfn0iUoHoo9/Aoib2Qdj3OkhhnTnNcQWJm8n50RlkgfF8j2RkzyXz
	JGmgFsxdzjAHtSWfm9F5ZGM4mqfnyCYsTlGhd4tndPplrWftLo57Id9ELbuExTb7
	hg4GLa8wt0+COOuq/QSmuwmwOiiV2xwPEDe7eQx7zF/ZW5YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehssq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 10:40:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53919fbfcso1029919585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819232; x=1769424032; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=FAqJsN2wI4i90yHzaK3P7LC3lrvME0+QFw2Ki6GDq/JeSm9md4usksQB2JUmHHDwKI
         /hlXGlKW12Zrw6s+hj6CFBQcuiAMXikld5bNBXBZ54SVuDDUnvGjBEQDKDW+Pa1D323I
         vbskz7pqHn9kBWxNv2t2B7WsKVaE9QzzDlfhM/nplhj3rtIdIkZOP8aqsAm5fDOo7JmZ
         3nKugnB0TmY2R/gUKRwUvf/af8wdmtkRyfnHHlMTGLq+gkGsNyxpqTkERNUWJwHQz4cv
         skxzDZVAEbtbFI6h2hAlSH364ataJjizhv8Gcbs0bz1wT6XNi4PaM9E8uFBsVVmmCgoT
         wxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819232; x=1769424032;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=Ge2zxuY0m+k3D1XmrQCAhUmBWjmB0R2hQ0x1X95lLlvBzKSrbFgGIrZ7bPwAASMIJ2
         licddPz88Ls1QcaPlH689j13Ubc2zJAAszVX5dbqs72zY0rtW8U8teGlKinlrNFuOlj3
         PcG5sn+f+vnwXTS6t1ljl0qvDFQtcA5ZsnMXt7a1yeJWtx+fuIEvyR5fhBg5dR7JFAvo
         x7SbdDmRyhrFN5/I29KiYthIGZl0p1lKsGlVqgpP39Q3Cz6+uN7SRbJ+m+fWB9eTu9HN
         otdRPX0RkzlW1ow+7Y53Fkjx4wjCjn21CySYjodflBfhi9/JAv9dnYBMjz22sLXocT5b
         89Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXJLBDu/7SVZ/AH2kSzHyhg3iwVXc47gDnfYC6fTnD0VbnGjyPFymZxXKRWz8pbFXK/yLwEKJNJMDLGrAY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAbY78Y9FVZsRCoSTIjPIJ7QJXCRVIg9QYruZHRyDdEivH3YPB
	V8cxGgwA/W6s5MbITNlY/dmr0Puc4Cq3AQn5NxEu64Sr2p/Tdx6/EkyadWY0EpYzxSJudcUVCEi
	PWf01vb7jk3UJp2y6GPtDKmu5YJPhtQ35B+/KLXj5y3GeyZeqbOpXcLkk8o+egoZ3+tcY
X-Gm-Gg: AY/fxX5EO1FSXfOj4DuCxfbB3ga/I0spGJbRXMOoGvrcztAcjl7pqMO+qINzJoRN5KO
	KOq01pI7JH415Y+hHxbdpM7+vYZz5fg8GKIgsZpW6bgo2X38GvnqgcxiuXNXO8k8pHd/KniCLHT
	9DEnthuHKGeIm9cghOYxDfAy7yl4ewXL5wMpQUkGS/yKzimtsxZ6PsnVHlxXbHBY7iKCNv4XRXM
	wbytiksaqFf3XMIapN2HF/6kQ0MynM8Qk/6hbz6CIYqpbZ0iRKuF+T1OIFMnJcgWCaV4wDQsrFO
	gqJ3mlYlHAlai7nnhEEuTOqVzWdnM2yHJ0Y4RqgNmZifOtK27gyqsQZYiQTuZ/8uOor73zgtXhU
	g0mD34DeMoS48zTWLbz9DQSdeMtRJGKcAztwfDz48
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531014085a.56.1768819231908;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531010485a.56.1768819231355;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/8] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 19 Jan 2026 11:40:11 +0100
Message-Id: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAsKbmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0NL3eL8ZN38NN2i/PwSXXPzZAuzZFMTA0ODNCWgjoKi1LTMCrBp0bG
 1tQCEhjJgXQAAAA==
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iSlD7Dh/mbSNiQJOq0DMMW6/96hXXaA8D+ljD2AYSQQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoPyu5DMHSDKBFDw0X0fP2m0FmfzN/Sdyy3W
 dqzR8wP3oeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KDwAKCRAFnS7L/zaE
 w3nQD/0YIZZ70BVx/YX83RjrD4BVPwudBPlg1Tus56sNutGPvS6lJZKSCW4P0t4BaiGMZYu0uXx
 DwSJRVUSD1zKm4YMyapEElVBmfRU9coZHgJpytVECZ3rhW0J6UyQtwHt1NdxBjnnGtvLekAiCUi
 vXpZ7P4xjn8TGkDrrO1PZRCSsxtwNMqQO3EJchlBxdPTBpZTGRvAKkoqYunwCejG6n1270zn98f
 X7MuSTcMvRTNqCwDzrzE3XOyPd35CWzMzMc//cChVADri226wL5wnjLkcmzaHJl+475efNQP25e
 LgL+OK2N6W0HujWTQQ7wUX68ImeORNrNcitC/JR4yg5498se0k9EYa5fSzVG4vDL771xG+QgNTm
 EqRyPPYj5Lv9aKzRsk6qf3tq5lpJGg7len19ubZ0SCzH10IsH6KOPF0LOAUihIR8A5vHVMGa5Sk
 crm/fM9EtP+WfFiTbkIUnkno84RmJ/p+BkIG90rRr2+vHGY1fIDfzcxsSgrtLhfOijOCC40nSla
 Ow7zYwTN3NNbOY/Hr0nqgcIRGp0UX0vW+EAv5ci1cDzFvWJ6PqqONuFE6xGalVaCwYN1zW9qh3w
 b9SP7pAjgLY6XTwQNhpp+q6LC+rE352LHeeE5ZPYuj39akWt1a4R+s43+NJH+aC2ifjqziQF+jx
 yElJMXxuP6CE8iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfX/uQboNfZoLMG
 gdqq7zHMdCJJWXTLcgWoMAp+4p41guZxR6xpeYeTbgS89SN3UkGAHBxgvwevn9k4qkocqjMzrQ8
 iYpd251n0aR0toK/jgfl253bFP3mlE8uZr/CYTHSNUTIYO0XxAlQwIDLd3JolwhLVCV8lQCaZYt
 +NPAeprZIRYR5+Qw2sYVwaToxJktLGrbGbjW6CcB+wRk23iTVo6m88B4m8/z3LYGUyBfOqwOKDe
 U0C9UbCf1tmMV84EwJNW1xSFVRYQIzFZ4MsyDtBRjJJimnOOA3dgDBhmujVqOmFaFQJecmMC//l
 EB/pIqGr2MtKSowYZiW3L5bwPX+FES15yF0rqeHKL6AzOHRCFtLEH2FvqO6gPph+MZlWyw82R+K
 c6PhHjIJIphmQJcGZFc7YnriFYHf+kqbZWDYDEUU8RXj0+QPywZYNrceTtq3C+C6hBwPlsHNNiz
 U9r5p4LV29zFTjF7UBQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e0a20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IK8FBO9Hk_FkL9rbzwgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tF25YfiOVs6JZUEubBs0YA9ntwbu2qVa
X-Proofpoint-GUID: tF25YfiOVs6JZUEubBs0YA9ntwbu2qVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190086
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces a new OF helper for reading the machine compatible
string, exports an existing SoC helper that reads the machine string
from the root node and finally replaces all direct accesses to of_root
with new or already existing helper functions.

Merging strategy: other than patch 1, everything else can go via the SoC
tree. I suggest Rob taking patch 1 for v7.0 through the OF tree and the
rest can be picked up after v7.0-rc1 is tagged.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (8):
      of: provide of_machine_get_compatible()
      base: soc: order includes alphabetically
      base: soc: export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 26 ++++++++++++++------------
 drivers/of/base.c                 | 13 +++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                |  2 ++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 54 insertions(+), 33 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


