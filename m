Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4742112E03
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 16:07:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Shz84WH4zDqXK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 02:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ShxC5f7JzDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 02:05:34 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4F3xea106780
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Dec 2019 10:05:30 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wntc89mbe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 10:05:30 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 4 Dec 2019 15:05:27 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Dec 2019 15:05:24 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB4F5NJp62521592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 15:05:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1B194204C;
 Wed,  4 Dec 2019 15:05:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53C414203F;
 Wed,  4 Dec 2019 15:05:22 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  4 Dec 2019 15:05:22 +0000 (GMT)
Date: Wed, 4 Dec 2019 20:35:21 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
References: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19120415-0016-0000-0000-000002D10D8D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120415-0017-0000-0000-000033330E58
Message-Id: <20191204150521.GB4824@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=650 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912040125
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Waiman Long <longman@redhat.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2019-12-04 19:14:58]:

> 
> 
>   # perf stat -a -r 5 ./schbench
> v5.4				                v5.4 + patch
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 47                           	50.0000th: 33
> 	74.0000th: 64                           	75.0000th: 44
> 	89.0000th: 76                           	90.0000th: 50
> 	94.0000th: 83                           	95.0000th: 53
> 	*98.0000th: 103                         	*99.0000th: 57
> 	98.5000th: 2124                         	99.5000th: 59
> 	98.9000th: 7976                         	99.9000th: 83
> 	min=-1, max=10519                       	min=0, max=117
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 45                           	50.0000th: 34
> 	74.0000th: 61                           	75.0000th: 45
> 	89.0000th: 70                           	90.0000th: 52
> 	94.0000th: 77                           	95.0000th: 56
> 	*98.0000th: 504                         	*99.0000th: 62
> 	98.5000th: 4012                         	99.5000th: 64
> 	98.9000th: 8168                         	99.9000th: 79
> 	min=-1, max=14500                       	min=0, max=123
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 48                           	50.0000th: 35
> 	74.0000th: 65                           	75.0000th: 47
> 	89.0000th: 76                           	90.0000th: 55
> 	94.0000th: 82                           	95.0000th: 59
> 	*98.0000th: 1098                        	*99.0000th: 67
> 	98.5000th: 3988                         	99.5000th: 71
> 	98.9000th: 9360                         	99.9000th: 98
> 	min=-1, max=19283                       	min=0, max=137
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 46                           	50.0000th: 35
> 	74.0000th: 63                           	75.0000th: 46
> 	89.0000th: 73                           	90.0000th: 53
> 	94.0000th: 78                           	95.0000th: 57
> 	*98.0000th: 113                         	*99.0000th: 63
> 	98.5000th: 2316                         	99.5000th: 65
> 	98.9000th: 7704                         	99.9000th: 83
> 	min=-1, max=17976                       	min=0, max=139
> Latency percentiles (usec)                      Latency percentiles (usec)
> 	49.0000th: 46                           	50.0000th: 34
> 	74.0000th: 62                           	75.0000th: 46
> 	89.0000th: 73                           	90.0000th: 53
> 	94.0000th: 79                           	95.0000th: 57
> 	*98.0000th: 97                          	*99.0000th: 64
> 	98.5000th: 1398                         	99.5000th: 70
> 	98.9000th: 8136                         	99.9000th: 100
> 	min=-1, max=10008                       	min=0, max=142
> 

Just to be clear, since these are latency values, lesser number is better.

-- 
Thanks and Regards
Srikar Dronamraju

