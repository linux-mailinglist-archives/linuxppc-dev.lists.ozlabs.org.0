Return-Path: <linuxppc-dev+bounces-8635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F9ABAD9F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:44:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RWp0B4Qz2ySN;
	Sun, 18 May 2025 13:44:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539861;
	cv=none; b=Q9lXKSbTa41Jmg4QcDTKvq0KhWcoS3lry1ACYj76C8EZZjsqmVggIlIZcZOkMog0BjIEJQg/rXwgde74fu1NzDXnu4Dr5lKzVfmqkcA/QWh5p7CYF2ygoEl07SMARz0ypY3rqwZIW0NDx/V/LG9KOFbfaY9tahV+O2f4kmc//q6CfgNXLmZC8oXXMv6QEhaG50IalUxOdnnHik5ul4lLxNQVKMKh01RiTWh6nx6XH6HcaaB5IOAtDmd4vorm4ggpyyWi+YatZuXQy+Mr0wFVEFOQPubxFSUUBJY7v+HwTyjZz/2/VQj9yXo5Gd35XvKNN5lIcv8Spn8KNRyXc8+PaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539861; c=relaxed/relaxed;
	bh=A2nGH3RZ/Q2lnrB9MPiXrhX9QIk4WxrhLk2FFNsFm0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMJHb1WdPIX3Nq7O1c0AqLulXPYisHd1LuUJIU860LRV8IvF/qSSC6VtK9ueD/9jAxICdpo16qqiPxve+xh1ic4PQ+Lm3+utnt1JdG+PEFm2B8l/BTIQgrgTOXFMsgG74CmaHaCXPGkRtrno/9n8nGaY8K+y6jcLxTrFtuzzsP0qeyNxbxL8+NHHZNR23KmyAQYFl4tdxlmwhBuu+dw72Uz8Z7RWhIQ1bg6/YJWn871HWdEcJnl0rroB2R3A+b/KbQOh2kXqGVZ6HLL6JYM1SQu2yc6qaFpqSyZsy80XbVzzVqZ3+A8pDx3UKdh8HsmYibubghdyhf83QPDNBancxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJbaf9eD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJbaf9eD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RWm2TlYz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:44:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HNq7Ab019790;
	Sun, 18 May 2025 03:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=A2nGH3
	RZ/Q2lnrB9MPiXrhX9QIk4WxrhLk2FFNsFm0c=; b=RJbaf9eDwqaHOJykpsfQpD
	wamSoveT3vJyRsc2R7L34F3wCagx901GtbZfcmDnAmJt2ydTS9fXuNT/dN5QZl1a
	HjCo6Ap0ON8XDXLjFJVRexrbhq6I9GvWrCtyGK4uEt85n4Y9A+eClN5/7Eku/ZaH
	PwiPZP49wM0Et2Q8Y9gthHvJ9X+PJqaQH1l+OAC0PQOmXU85RYQ0Y1BtHMH9hNNI
	JXTl4ViZ/oqWiWPuUGxUvbsxFjpr3Z5dgOPruh61h3zld+IjPTW05afKwA1sCmgo
	hQRGaocEvxtT/neB79x53pNjy6UuTpRjgD9VbtZRxjQiYGmOJIh2ETZiZYOsrS5w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pup320sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I2gLU9007183;
	Sun, 18 May 2025 03:44:15 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q70k05wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3iBpl20971970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A04E20071;
	Sun, 18 May 2025 03:44:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8891720065;
	Sun, 18 May 2025 03:44:05 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:05 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Athira Rajeev <atrajeev@linux.ibm.com>
Cc: disgoel@linux.vnet.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, adubey@linux.ibm.com, skb99@linux.ibm.com,
        sshegde@linux.ibm.com, riteshh@linux.ibm.com, Tejas.Manhas1@ibm.com,
        venkat88@linux.ibm.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/pseries/htmdump: Include header file to get is_kvm_guest() definition
Date: Sun, 18 May 2025 09:14:03 +0530
Message-ID: <174753967073.24504.9825164448182555887.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506135232.69014-1-atrajeev@linux.ibm.com>
References: <20250506135232.69014-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: HDK936ya--DpIkgEwhQeoL7hx0epcQwp
X-Proofpoint-GUID: HDK936ya--DpIkgEwhQeoL7hx0epcQwp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX666ASwdr8eZ8 oZLKA+cStlnY/RH+CyTwmOALveV/Sh2KYFZVbCjH04i2UCs2XVmWb4aXnu0h14Blb8Qk9cs+utT 1Zbfqq08jGG2/KW2bLwhvQbZhqbR1Iy12KQV3fWl+oq3hz7X1gl3veoz81oIvuP7kZZFRF+0TkF
 PmxGCzJuNyBNp7xcUCJMAOSmLKVN+Poh2ugmixIvY4w/WjmCfZ7MfjOsawfxMsB9nT88Vu/Ox8j yPWXrH2IHqSjuE2D2J5BsX3tFxKb8UftSa1lFkRClxO7sJbXaSnTsu1o+WA2LFO2TJwYBIHGmOM MdZ2MKB963F5H8osJpaF4nCYzf5OZe1rHX3Vs4xerONo42w89l7IjI8iLCMbD0zP8pSaceluQ0N
 AKDpCeClm1xummeHfLwfKc+DkO8YJ4M2ByWJaEA7vJec3nqgc2UF6WPGJQrdtgQbSfRPXB9q
X-Authority-Analysis: v=2.4 cv=NKXV+16g c=1 sm=1 tr=0 ts=6829578f cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=1cS5dlDDN5VTN3lmXyMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=896
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 06 May 2025 19:22:32 +0530, Athira Rajeev wrote:
> htmdump_init calls is_kvm_guest() to check for guest environment.
> is_kvm_guest() is defined in kvm_guest.h header file. Without including
> the header file, build hits error failing to find the function.
> 
>   arch/powerpc/platforms/pseries/htmdump.c: In function 'htmdump_init':
>   arch/powerpc/platforms/pseries/htmdump.c:469:6: error: implicit declaration of function 'is_kvm_guest';
>   did you mean '__key_get'? [-Werror=implicit-function-declaration]
>   if (is_kvm_guest()) {
>       ^~~~~~~~~~~~
>       __key_get
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/htmdump: Include header file to get is_kvm_guest() definition
      https://git.kernel.org/powerpc/c/2c54e431574f829ec0895d5104575b3f209eae28

Thanks

