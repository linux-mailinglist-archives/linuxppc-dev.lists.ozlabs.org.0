Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F804540AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 07:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvCL91bwQz2yQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 17:13:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aUWGaf5U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aUWGaf5U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvCKT72Tlz2x9J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 17:13:17 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5pfW0008522; 
 Wed, 17 Nov 2021 06:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=HKoMs6XymZkZAijMq7QXLt5zvNvnSKN4o+b5MV1O2pA=;
 b=aUWGaf5UhAbnL0RUONHWP3sYaHMpbZX1Baqjs8MXKzG0+IINIfisSaoN7JPUZwSJTLzF
 6rmAy9LZK0Pj9HpXwynz4IdAa23bhxFkROJDTaHpLx8qvR6gK7+V/K/wIZjNToV/t0Ib
 jdUVo5GDBqOzRBeTyIEghoImHyib2lRREEfyp1m9qvfXPk8IrwK02N7/OcRK/QAM6QkX
 6dnSzT9goCodQ/7TirIfm8GAvHg9qa8wTNBu9/QB//9poePYBtrzloUOQ/TM+0BSTJ/1
 gh9p+ucTSizETjDP3powQ5ZqAYGZT2uzMtxSNkdpDWGrZHLFTuAJZO83MU9MdAwdFFOg Ng== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccuy7gcf4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:13:15 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AH5wpht026586;
 Wed, 17 Nov 2021 06:13:14 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3ca50c5a9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 06:13:13 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AH6DCwC45285674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 06:13:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 319A16A057;
 Wed, 17 Nov 2021 06:13:12 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06E856A051;
 Wed, 17 Nov 2021 06:13:11 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 06:13:11 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/rtas: rtas_busy_delay() improvements
In-Reply-To: <20211117060259.957178-2-nathanl@linux.ibm.com>
References: <20211117060259.957178-1-nathanl@linux.ibm.com>
 <20211117060259.957178-2-nathanl@linux.ibm.com>
Date: Wed, 17 Nov 2021 00:13:11 -0600
Message-ID: <87pmqzia2w.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Kwe7KQlj9Uz4yDfuNSwNBQ62sKyPwccK
X-Proofpoint-GUID: Kwe7KQlj9Uz4yDfuNSwNBQ62sKyPwccK
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=826 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170029
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
Cc: aik@ozlabs.ru, tyreld@linux.ibm.com, cheloha@linux.ibm.com,
 ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>
> Notes:
>     This could be considered a sequel to:
>     
>     https://lore.kernel.org/linuxppc-dev/20210504030358.1715034-1-nathanl@linux.ibm.com/
>     
>     which tried to address both the suboptimal delay behavior as well as naming
>     issues. The present change achieves the performance improvement and leaves
>     the matter of naming for another time.
>     
>     I've incorporated Alexey's feedback from that series to avoid division when
>     calculating the arguments to usleep_range().

Oops, this part is redundant with information in the cover. Git should
discard it if/when applied, though.
