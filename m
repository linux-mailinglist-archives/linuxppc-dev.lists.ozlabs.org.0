Return-Path: <linuxppc-dev+bounces-8554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE49AB6163
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 06:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy0876v8Mz2yr4;
	Wed, 14 May 2025 14:03:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747195431;
	cv=none; b=FbDScXXXb1AOWFrgHvDZ5UiDl7MjHA+AVFTZHnJfXAWulXqaUX/u00RFgmtqa1k7skz2DMnnkD1VBT+LrJgJSSc5x3n+ZIrn+o6dHDSEHFZ0pcZRjtiCe0PMgt44M9LpAElE80Ki/LxBkB3PCkAvlY0X3xngalukFKRyR5F9sy06ufmyiL8/d/GFYWrOTMbBTZEEVtukq+ITpzNyZars8hrh7x2Ne7wimFROm2eIan3wBgP3eZti3RKbqnQ0OVhbhTaA1rMO539eQzn0YUjkAlMUIQcwCcbpvAx6XAebtoJrG4P+zy//+na9y9AxvTpiE7fvQ+YurOxTuvukBmyeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747195431; c=relaxed/relaxed;
	bh=Z9ZYzi7aP+vNyi1n8ywMKND7BkRDE1clXjid/E6/O4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtWUOpAUNgamZZ0KwZojc7J831NSpd2GnUOhG9dsAFu8uOnE+ykWFBMTkn467ATdP8bpTWgj8hXiDu7trLkDwp107gewFPFCKur5tljsxG5dFta4MBij67Ncfcb7G+S2eUvKL8CejC3SaA2ruRhLEhhpCrPO67u+w4LcfEt47N3BiADMT0iz/BtWzFHGtfXVqHWmZEIY0tKxZlyEAOLNCzaXz9a5KdP3KUFxO8ELnC0IJF1V8rgBG7Ik3YlQol7+eVJdr34OtqRrXWvJL1fVgCcLjVFr91SN3J5kecE/vIRTuC0LmK9dIl4UFNguO/qTT9qLk2h7aOMIVeKFFJr9tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=crJiLe75; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=crJiLe75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy0866y9Pz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 14:03:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIb2JV015795
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Z9ZYzi
	7aP+vNyi1n8ywMKND7BkRDE1clXjid/E6/O4o=; b=crJiLe75jijfnZ428RSiYY
	ch88oiCPEHYfAsrJ1gmlbtvNAz9aWzcfaZLH7O5mrnp8UnC60DhuGDWUm/oGzl9e
	lRMSXLAWsmI4czvSijZvg9c/QfjHBVKce4B3SmNtCR3JMUPFqiSKW/YsOzNV3C3j
	jJDWBOoGQMu4aUPifxeZkPivVUfvm7ok+gR0gFFXquonvykbbkf+uLrPvELt5hEG
	BW3F6whtqRKe37F7cN6jbEP1CEVp4rcpf0TlwEiQn7jjFbx4pJ3uIO6yAuU0bhwg
	X1Z7zPMUoCxmU9bTAiWsoqGwVOiHM5ZrutNocc3YiHdqUKWRllxCsr1DezaK86uQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46mbh2j1xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:03:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54E21rNS015330
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:03:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfpt6yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:03:46 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54E43ftk43778512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 04:03:41 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D9DD2006A;
	Wed, 14 May 2025 04:03:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27F8F20065;
	Wed, 14 May 2025 04:03:39 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 May 2025 04:03:38 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Athira Rajeev <atrajeev@linux.ibm.com>
Cc: disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, adubey@linux.ibm.com, skb99@linux.ibm.com,
        sshegde@linux.ibm.com, riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com,
        venkat88@linux.ibm.com
Subject: Re: [PATCH V3 0/9] Add support for configure and control of Hardware Trace Macro(HTM)
Date: Wed, 14 May 2025 09:33:38 +0530
Message-ID: <174719490577.1067444.40286639589368405.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420180844.53128-1-atrajeev@linux.ibm.com>
References: <20250420180844.53128-1-atrajeev@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5R63RXy2kzJ_T9r1rD6C2Xwf1FRyEcHM
X-Authority-Analysis: v=2.4 cv=ZcYdNtVA c=1 sm=1 tr=0 ts=68241623 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=5TQhZt2VqR0EUXtJx64A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAyOSBTYWx0ZWRfX+Jydnsj3Swka TKFCl0z2Bb2QWjHg/E0GpF0Hk/K/4ocTRCFZ47wRR5jPSbT0HIvDx8Dg80CLEW+ztwYLbiBkf3V 9YFRD41nrOriFhJGdVh1O5FjG1qomrX4Z/xhdsCXJyEqE+dIVKviNCe31m5XstmT+moan1OGxXw
 mYqduL0KVvu0xdqJFB0zHa2jtVBBppeBVCp+h7UJj2mAp02u6WIU7cgsGrjozfMkEHzLdbysYAs OxW29p94adTNSdVPFq5V6e2PU6fR8SlWNpQs1t7Zc4/hDglUNljD7+QcTuFeLb8OuuvQuN5L+CC oPJnZEKS1nMwSDZ/PVu0r8te5Yg/C4x4e+a4rjMtNGm06svuj951BOYvkUWX5KzwXml59P9SwdJ
 uSV/Tyol4qz7P7piAxQxrRIrcH4mlNiCpDjYZVJx4571ZWqa6W1J22wa0/3a/0yN33MF72NF
X-Proofpoint-GUID: 5R63RXy2kzJ_T9r1rD6C2Xwf1FRyEcHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=897 adultscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140029
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 20 Apr 2025 23:38:35 +0530, Athira Rajeev wrote:
> H_HTM (Hardware Trace Macro) hypervisor call is an HCALL to export
> data from Hardware Trace Macro (HTM) function. The debugfs interface
> to export the HTM function data in a partition currently supports only
> dumping of HTM data in an lpar. Patchset add support for configuration
> and control of HTM function via debugfs interface.
> 
> With the patchset, after loading htmdump module,
> below files are present:
> 
> [...]

Applied to powerpc/next.

[1/9] powerpc/pseries/htmdump: Add htm_hcall_wrapper to integrate other htm operations
      https://git.kernel.org/powerpc/c/6e204ef3b73e41e46784fdd298c3d81caed84873
[2/9] powerpc/pseries/htmdump: Add htm configure support to htmdump module
      https://git.kernel.org/powerpc/c/c6edd034e39f745feb9ad5298b92e0fec5bb9e9f
[3/9] powerpc/pseries/htmdump: Add htm start support to htmdump module
      https://git.kernel.org/powerpc/c/e03e4b12dee95bb87507a50772f927d0eb152ca1
[4/9] powerpc/pseries/htmdump: Add htm status support to htmdump module
      https://git.kernel.org/powerpc/c/627cf584f4c36acb52230ffc47403cf9469ec9d0
[5/9] powerpc/pseries/htmdump: Add htm info support to htmdump module
      https://git.kernel.org/powerpc/c/dea7384e14e7f9429021544d0d710fbef8445def
[6/9] powerpc/pseries/htmdump: Add htm setup support to htmdump module
      https://git.kernel.org/powerpc/c/78fb17ac68bf59e5e36212e34a2b05eec29a389f
[7/9] powerpc/pseries/htmdump: Add htm flags support to htmdump module
      https://git.kernel.org/powerpc/c/d3f24bf27b2de2bbf35faae72ca3a81e23ac9e22
[8/9] powerpc/pseries/htmdump: Add htm capabilities support to htmdump module
      https://git.kernel.org/powerpc/c/143a2584627cc02af81261c0201f9a69c08241a5
[9/9] powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface
      https://git.kernel.org/powerpc/c/ab1456c5aa7a63d5145547fc644bd4580dd253f2

Thanks

