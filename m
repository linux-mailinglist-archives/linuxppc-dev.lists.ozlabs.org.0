Return-Path: <linuxppc-dev+bounces-16482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIUfOWI3fmnjWQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 18:09:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CAC3209
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 18:09:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3KB11s4Nz2xm3;
	Sun, 01 Feb 2026 04:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.180.131 arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769871514;
	cv=pass; b=DGYXJsHxNLtzpyu9WyjJW8GhK1BV+oqUd+VkhWXD6vx/r1In2a5cYCkDT38DVI1fENA5SiY08UBgFtY25BupyFMKn9dpPXzDRfi6JfmW/cYYYXfK3UbWxCefThOFn4k136yipDrRiJ2MALOv8RSDo+xuhXTnpx8U83oBr7GIP/tC0T67KyqiVrGjk6sPDFOlcDC9xYGEwlBSErHrhJjLUJwUDy5D/Eicfv5kWIMo0RKB38pucJA+ezQ3jwuxqlttE6vbqk8nhgjw7OUN6nGkShmBMBH6Q/br/tunYaNHpDXdMPIoPhjTWMaP/f9DXMH9TU5fPQhS4vsDelFPY/MUNA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769871514; c=relaxed/relaxed;
	bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwWKRzbDNEcIgjeDjEAwxaK+1vOC6akhAaWbWs00yKWTDggS91h9ofh0Y+e444z1YODWn9v11lZqGpFqMhcFcnWDVzpR2AORX+V6FDDh11N3bdiYX0be5S6lRGpEyWI1qdnbzaTKTdO19Rik2ArvXA2CHV3RPr9sEZEGGmAuG+5wVgZyX6hEuZT5tAUfJJ4IQSzkf4mLPHl5dQJWe6/C7scr8J71cdkO9aEBJtRRx47xekXLlWf9BvzzZEqAkteHjkXlUx5vOhZSklqE9u8gXlK4G/4/7SHAqD5wTAvNqq/9xhsHifzhR7l/+JYB5cl/7v9dzH9ZJsGtQwbiSFbh5g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OvHzB4qP; dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fc5LSb0q; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.kurapati@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OvHzB4qP;
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fc5LSb0q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.kurapati@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3GGc5CCbz2xSN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Feb 2026 01:58:31 +1100 (AEDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60VDEfgw2565170
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 14:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=; b=OvHzB4qP/0jw0pjw
	qHWpKU9MTVgAy76IZFOwvomNtT5ojMnLFjv9vAMABxUYDDdhCdM/mdh/1U5ckbR1
	OHXys8Fv+a3PchmsefgHP4EyfqjCbDSoUrH0Z9vDG2TJsjY7dmvbMOIBYgB07cQC
	ID8YMzju3Vh/8MpgAyNwHRivnN+v5eYDr5CIhLCfTj2mGS4XRYyxzAUFh9cINBG3
	4lbqX8kwiPdpC2X1VC+X57Yc4hGnLxfwp4WoeziP1V7KW8OWpTYzBS2/84Kelkij
	c7Hl5zdRcBv8uYhTITx455LsNqpLBdwF+tnJlsXg2fGzqhfqDBQ8OAyarNxVhK3m
	+a43bA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard0xyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 14:58:27 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6494cbfe6b7so3902532d50.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 06:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769871507; cv=none;
        d=google.com; s=arc-20240605;
        b=FEzsZDxPEyTMBPc9NIu5rFedzoBi3GbVXfh2ba1lPQEmQFF/QceipYI2SH/XAzwHtp
         3dVxKfM5MbGtya4sxgK+Bq34rRAmvzbYzGh/bUZ37rUzSYh7cmKXjdfNdjPbFqtG7lZI
         cJXAz/ryDxFOGj1Rh3CaMyRvK+bdakvZZG+ZE/1Wutedf7nbiLaZAlAqgUp7b60zsi8E
         5M9biSJxH+7zh63c44t9ppMTUTk2O6KCM0nwagAa8ESwQUXxgwweE8/IhWQGwXbcu/gh
         VOWaapc57si2dKi00H2x9ggmf5yX+R8UhWMXq3BPGwXgvP5YzlDItFm08/x17x2xL/pj
         W8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        fh=+DDbu/dBnif81Fpzvvs0EXVYcqQtF9Xi8V7qXH3luVg=;
        b=SMApFc7ETualaYT31pEDkXgBkB+MlLwUdXUW7jObXfHmBva6M8/o2wyeyB2F/2pmXL
         d9jVqpuiyDUdlvZTX6H2Wz50iIFIDVrT/mclQkN4PedmmsNN7IuiNgIqU/KvqwyT71ZZ
         bvx//GZS515xTW80iGW9ifvG5iJ0t/zSVrS1jrQ9llWHcVeMvt8eCilOyB+CFj5Ov8IS
         T2ll9FByomVXB1rVvt4tyuGH9KghXrPY1WwXo9wU/RRI0QDeZdUzzxgCoZ6UrpPFwM9D
         dbd/jK1fSbFhp3LGd9ldBCYnKOf90kmWV9Y+Ie3//PH5mlu4qCMMSdMA261X5tXmWyot
         SMrQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769871507; x=1770476307; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        b=fc5LSb0ql0R3yPIphNKnLFt2in6EapAS2mJ1ajz3ZHpqEtvqK+nLOaMWZDtpTEzCx/
         CE8/NolIV3xhah/J2ewOnYVSy8WdZoiFhVNGil5pCXcbrycGsdeHQMpxVLCRKjF5LoEg
         OkCipjcgPY0b8+9VzG6dAmTsd/rxfAfxjzp9uBF/VGS28tfboZ3JZRrFGccorTTaKD45
         Ukq9/t0V8sc/eoaWQ8Dc6Rx4jNg4srNdDuYS+6Fii7U0JLKUKhRNCC5nTCR2v9o2pbnQ
         Y2sZR6GUVUmg8EbQMI8AuMGjEomRiwhPyC8GryoDo7vhanevkH59XusWw39np3ILqXK/
         DaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769871507; x=1770476307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjEvOy2WGDJOvuBTZY4HtZUR5P6Q5ANbgXFoz/CfBwA=;
        b=mHfb+jU+hfnwDkQIuvXH7OXhj/Dy8pvmZVI8U0jFF3eQgHnoKzo9kiByZeGwWt5Iy0
         VJaZOSvnqo3IYHhyDSm/lFYYrOcxyb8rqNQnlU3PSedaxX7YTPIj+nURTUiXvH4q0P2N
         ubyqQ6hhIvgkPP8XPUNkBWRgTxjft4/y7Eg4qqiNquXNx0YfSUI7gknG3q6uuG1KawUP
         mqb3WT6WmwfSu1r5Famr4ASyHvc2FRba5B76SALwTs6C7Dv6UHvy0z4wWyk96b9KvNU3
         I2KuGnyHXko/yTRMcLYQZSEgBGYC9fLlSIU69UC5rMtpr/Rxtb/TOvseY3T7jUZooyAz
         6NFg==
X-Forwarded-Encrypted: i=1; AJvYcCX5s84enaHhJg8SxQ6bvPHvy2F5VtKauKMCY7LjpVjic0/0CWIGa4CT/z1CvvcrA/X+2gJ2JrrtFwgcPMY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRPKxw3njNxnYSmxLp6ms5m1h1qf0Hu5KxdvJ5LdyMKQedkMcm
	+4fCfQtOudzhyZP6i8R2nggK1T0z6ZgY1kayMnx0C8/Gg9i6tP+TsdM9R9d9aqRDZQJ0K+8mitW
	aVqi/0eBQr/8yNVGxvRbto57CbfH+WqxDaQT6OlA5GPPmv+hc9DgRWH9t5UWLEJ4q4h4hZ/oj9e
	+qRN6yd12AfxBaECqmlYdBPGaPK+btB1aWmpsWad8V7uQ=
X-Gm-Gg: AZuq6aLrUrBIMiTUznwvqBKRx7Fusk1CF5mmSLYVuBtG37niKlh/bwL/er6pgZrAgpm
	1hQoZWQiO75V7iOO36nWQeXRHBPthDHwvP7XFxbygx4hJyWT7BcmrVlieeCzT1RC1HGU2PrDXrT
	vfHBk18oF9F7R75zYRW5MMbLwX8P3e4Qex1f1CmwHB7w8Ug9e86PU+0NrL5cTggygVQn0=
X-Received: by 2002:a05:690e:4107:b0:649:7c5c:88e3 with SMTP id 956f58d0204a3-649a8547db8mr4403456d50.95.1769871506937;
        Sat, 31 Jan 2026 06:58:26 -0800 (PST)
X-Received: by 2002:a05:690e:4107:b0:649:7c5c:88e3 with SMTP id
 956f58d0204a3-649a8547db8mr4403441d50.95.1769871506570; Sat, 31 Jan 2026
 06:58:26 -0800 (PST)
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
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV> <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
In-Reply-To: <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
From: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 20:28:15 +0530
X-Gm-Features: AZwV_Qjt6-X-XbfNyo2_bleHjewtRG1qoA5gEXW9Hu9LjqRyKmxz-97xcVzcIio
Message-ID: <CAEiyvppoiL2EiSmVvNV3DEkr7wwyC1Fbwhm14h7Rfus4Z8uP7g@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Samuel Wu <wusamuel@google.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Greg KH <gregkh@linuxfoundation.org>,
        linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
        brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu,
        neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org,
        linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
        kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
        paul@paul-moore.com, casey@schaufler-ca.com,
        linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
        selinux@vger.kernel.org, borntraeger@linux.ibm.com,
        bpf@vger.kernel.org, clm@meta.com,
        android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDEyNSBTYWx0ZWRfX0sSki7+qyv8S
 G+Zty89Ro84r4vgisxMdOrzjRYRKjnlku1zlS3gxtWipKba1aqLK54iKJu7xjJaD5vGCUmSiR5N
 xHCIAcIQsz7v9ZxhTZmuJvA6OpDEiBO+OaCuBZPi2XPq9T2chR1cP3FOpkeTTTF6O89escxF+ga
 ASCYGyiBTNWQ1e1eN/WlkssCm8FNOFZRlXefcjLJOvzydPOA4IAPLXukSfiL0WcICmujOYvNm1C
 oJgmia7iUw1zxF95NypVrRhAHvpxEGIdpusQTaplZlcoeCF93BnvkErd+dbR/PSkOQ6e+sgYn/p
 8Q1kuDTyxmDqxEPI4e1eBLM39FOUbn+hhN4yCiJoA1/FwphMzXG4J1GG8RRN+mzUvfXtf29myN+
 p7b806QKZOiIDvo7sluSSL4upvjQE9AlyLByYAgCwn9bNBqTyN8iqj+nWXX/8R45SatZVsA1MtE
 KHVBqdpo4fELrAKOl9A==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=697e1893 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=1XWaLZrsAAAA:8 a=drOt6m5kAAAA:8 a=wEBb_YokH4NsbSDSc3AA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=RMMjzBEyIzXRtoq5n5K6:22
X-Proofpoint-ORIG-GUID: n5GDg0YO3qU2j7Q-vI1dAChK9CaRiTfN
X-Proofpoint-GUID: n5GDg0YO3qU2j7Q-vI1dAChK9CaRiTfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_02,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1011 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310125
X-Spam-Status: No, score=0.3 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16482-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:wusamuel@google.com,m:viro@zeniv.linux.org.uk,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[viro.zeniv.linux.org.uk:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,oss.qualcomm.com:dkim,linux.org.uk:email]
X-Rspamd-Queue-Id: 3D9CAC3209
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 6:46=E2=80=AFAM Samuel Wu <wusamuel@google.com> wro=
te:
>
> On Thu, Jan 29, 2026 at 2:52=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk>=
 wrote:
>

[...]

> I'm exploring a few other paths, but not having USB access makes
> traditional tools a bit difficult. One thing I'm rechecking and is
> worth mentioning is the lockdep below: it's been present for quite
> some time now, but I'm not sure if it would have some undesired
> interaction with your patch.
>
> [ BUG: Invalid wait context ]
> 6.18.0-rc5-mainline-maybe-dirty-4k
> -----------------------------
> irq/360-dwc3/352 is trying to lock:
> ffffff800792deb8 (&psy->extensions_sem){.+.+}-{3:3}, at:
> __power_supply_set_property+0x40/0x180
> other info that might help us debug this:
> context-{4:4}
> 1 lock held by irq/360-dwc3/352:
>  #0: ffffff8017bb98f0 (&gi->spinlock){....}-{2:2}, at:
> configfs_composite_suspend+0x28/0x68
> Call trace:
>  show_stack+0x18/0x28 (C)
>  __dump_stack+0x28/0x3c
>  dump_stack_lvl+0xac/0xf0
>  dump_stack+0x18/0x3c
>  __lock_acquire+0x794/0x2bec
>  lock_acquire+0x148/0x2cc
>  down_read+0x3c/0x194
>  __power_supply_set_property+0x40/0x180
>  power_supply_set_property+0x14/0x20
>  dwc3_gadget_vbus_draw+0x8c/0xcc
>  usb_gadget_vbus_draw+0x48/0x130
>  composite_suspend+0xcc/0xe4
>  configfs_composite_suspend+0x44/0x68
>  dwc3_thread_interrupt+0x8f8/0xc88
>  irq_thread_fn+0x48/0xa8
>  irq_thread+0x150/0x31c
>  kthread+0x150/0x280
>  ret_from_fork+0x10/0x20
>

Hi Samuel,

 Not sure if it helps, but Prashanth recently pushed a patch to
address this vbus_draw kernel panic:
 https://lore.kernel.org/all/20260129111403.3081730-1-prashanth.k@oss.qualc=
omm.com/

 Can you check if it fixes the above crash in vbus_draw.

Regards,
Krishna,

