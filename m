Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767AF82B40E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 18:28:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qSBFom5A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9s7q04Npz3cYv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jan 2024 04:28:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qSBFom5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9s704HfDz3bbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 04:27:24 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40BFVCxM027610;
	Thu, 11 Jan 2024 17:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Rr2akWAmrXqGDR2rnFbHSU7APart35OLIahqQOxuJRg=;
 b=qSBFom5ASe1zQeNrGKn+Igx9jiumfMwC/r8c4eizrTQ40ycP8u8B7wAgY6smaKa/trzy
 C5yqoQIctMWQ/DLLHF1p0cb9fk1r6Kykm4kNzhU/C6hN3wZjcOywa6Wl8SuyCUckbY/V
 8NNdWPiAlCIiI8RpScn4uzNIV/zOU1jTrNtKRr3dGtkovhEBttwaoNcM6Axv2lf66ill
 7B+F2ji0etUNtwv62hUVcA38/0P0aQ/pUd2wQCYxLpDx48NTayanMDcxMrC5HxMg/RZ1
 wqTdjs9wbAaw4bMKoV3nbrsUy1IY5Ru5DeYyJg/Q7MxjiR0csn4e312260Wn+v/76CG7 9g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjgmxf27s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 17:27:15 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40BGsW5u018143;
	Thu, 11 Jan 2024 17:27:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjgmxf26m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 17:27:14 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40BGMDqE027254;
	Thu, 11 Jan 2024 17:27:13 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkw2ceba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 17:27:13 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40BHRC347864874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 17:27:12 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58AD95805F;
	Thu, 11 Jan 2024 17:27:12 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37E3358059;
	Thu, 11 Jan 2024 17:27:12 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jan 2024 17:27:12 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20240111062510.1889752-1-haren@linux.ibm.com>
References: <20240111062510.1889752-1-haren@linux.ibm.com>
Date: Thu, 11 Jan 2024 11:27:11 -0600
Message-ID: <87v87zaihc.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A21CN73_XWdPPdaVyUOI92JrtEsrXLCo
X-Proofpoint-ORIG-GUID: ZJwRIpmDzoNxSqhGTSHe910CtpEmtzYL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_09,2024-01-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401110137
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: aneesh.kumar@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
>
> The open and close VAS window functions hold mutex and then issue
> these HCALLs. So these operations can take longer than the
> necessary when multiple threads issue open or close window APIs
> simultaneously, especially might affect the performance in the
> case of repeat open/close APIs for each compression request.
> On the large machine configuration which allows more simultaneous
> open/close windows (Ex: 240 cores provides 4800 VAS credits), the
> user can observe hung task traces in dmesg due to mutex contention
> around open/close HCAlls.

Is this because the workload queues enough tasks on the mutex to trigger
the hung task watchdog? With a threshold of 120 seconds, something on
the order of ~6000 tasks each taking 20ms or more to traverse this
critical section would cause the problem I think you're describing.

Presumably this change improves the situation, but the commit message
isn't explicit. Have you measured the "throughput" of window open/close
activity before and after? Anything that quantifies the improvement
would be welcome.

> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 71d52a670d95..79ffe8868c04 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -38,7 +38,27 @@ static long hcall_return_busy_check(long rc)
>  {
>  	/* Check if we are stalled for some time */
>  	if (H_IS_LONG_BUSY(rc)) {
> -		msleep(get_longbusy_msecs(rc));
> +		unsigned int ms;
> +		/*
> +		 * Allocate, Modify and Deallocate HCALLs returns
> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
> +		 * for the long delay. So the sleep time should always
> +		 * be either 1 or 10msecs, but in case if the HCALL
> +		 * returns the long delay > 10 msecs, clamp the sleep
> +		 * time to 10msecs.
> +		 */
> +		ms = clamp(get_longbusy_msecs(rc), 1, 10);
> +
> +		/*
> +		 * msleep() will often sleep at least 20 msecs even
> +		 * though the hypervisor suggests that the OS reissue
> +		 * HCALLs after 1 or 10msecs. Also the delay hint from
> +		 * the HCALL is just a suggestion. So OK to pause for
> +		 * less time than the hinted delay. Use usleep_range()
> +		 * to ensure we don't sleep much longer than actually
> +		 * needed.
> +		 */
> +		usleep_range(ms * 100, ms * USEC_PER_MSEC);

                usleep_range(ms * (USEC_PER_MSEC / 10), ms * USEC_PER_MSEC);

is probably what reviewers want to see when they ask you to use
USEC_PER_MSEC. I.e. both arguments to usleep_range() should be expressed
in terms of USEC_PER_MSEC.
