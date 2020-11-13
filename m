Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C532B1FDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 17:16:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXk9G3k9RzDr9M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 03:16:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Di68s96o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXk7H4wGjzDr6w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 03:14:12 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADG4FJY108644; Fri, 13 Nov 2020 11:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ix5xI4eV4ktS+Si1szwX06PnD5N08iIL8loUbC9USd4=;
 b=Di68s96oFj1bnmBRJNT61Cnensd3C0ZpX1WCk4O0Ghr3eBt6DtBjfm8L1ifiz/mLyogO
 9J5eQdU5Wrx3bkJqIL7iNDvw4HJSeGnhNcmrB/AEr4B3Lgxli6PUFutDQQUzymWmhCvV
 4SCX2UtW3SaQAp/xv4ajWTtyH6POEHrLM5veKRu71FRbD+eN7xLWWF2W9vfEXWqqb/fx
 iOhRLxES7rsmBfaMQQzqDeIzm1td4SBTZutGTrjzxEpmuCiEWw41ZOhTUeeATDi3EupF
 1jzbS02AmVGoil8yhoVBp9UZBnct8ioF1wydnGWw7fQW7Cug+whhDlr9/5NRtAqXqIJZ 3A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34svsd188t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 11:14:09 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ADG7rFQ002203;
 Fri, 13 Nov 2020 16:14:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 34nk7rutft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 16:14:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ADGDrkR37683670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 16:13:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C50278069;
 Fri, 13 Nov 2020 16:14:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 725C178060;
 Fri, 13 Nov 2020 16:14:01 +0000 (GMT)
Received: from oc6034535106.ibm.com (unknown [9.163.48.97])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Nov 2020 16:14:01 +0000 (GMT)
Subject: Re: [PATCH net-next 01/12] ibmvnic: Ensure that subCRQ entry reads
 are ordered
To: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org
References: <1605208207-1896-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605208207-1896-2-git-send-email-tlfalcon@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
Message-ID: <46bb6e10-ffb0-273f-bc8e-b57cfcf814f8@linux.vnet.ibm.com>
Date: Fri, 13 Nov 2020 10:14:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1605208207-1896-2-git-send-email-tlfalcon@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_10:2020-11-13,
 2020-11-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=983 spamscore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130099
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
Cc: cforno12@linux.ibm.com, ljp@linux.vnet.ibm.com, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com, drt@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Brian King <brking@linux.vnet.ibm.com>


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

