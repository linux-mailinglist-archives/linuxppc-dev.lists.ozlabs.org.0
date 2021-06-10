Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF563A3158
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 18:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G191b2nVjz309y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 02:49:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gxBRII4T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=drt@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gxBRII4T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G19172QYdz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 02:49:14 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AGYJj9191943; Thu, 10 Jun 2021 12:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-type : content-transfer-encoding : date : from : to : cc : subject
 : in-reply-to : references : message-id; s=pp1;
 bh=O16dIPOu+lA989Tusv2fGa0q2M5u6OuqRTodshl8cXw=;
 b=gxBRII4T5KSTDb0YPAYqOXjGlyb/TbLmcJAtLggjXLxjFlLEOeJXww4h+AYCuv2O0bN1
 IKlJ8mgV9+/jszNJFspPizd1W2FFTwtlb26wBCt5LtqkJdwQiYsz8meP4Tquc5IAXyp3
 MFCTymdCqETsQLWd3FaQeZ6NNmgG/ZhHLtX36wWduqgXhUFENhDU2bQNu2zuTOLGaykw
 JPssn/fKDepKTr85aacncXQJWc0uvUNd3ggvBIbEuW8pf0wl5L6mTAXNlEyOBMWCXPZU
 tLltYvMNBNf5JpmKMSMZMSvtR0I9ivBXLv7zWO9tfkNncA76w+yRl/jp+sb434rUd/7P FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393n76k40h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 12:48:52 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15AGYYKD193372;
 Thu, 10 Jun 2021 12:48:52 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 393n76k407-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 12:48:51 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AGlOWe031296;
 Thu, 10 Jun 2021 16:48:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 3900wa3yex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:48:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AGmnDV10224340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 16:48:49 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51B57136051;
 Thu, 10 Jun 2021 16:48:49 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAC0413604F;
 Thu, 10 Jun 2021 16:48:48 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 10 Jun 2021 16:48:48 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 10 Jun 2021 09:48:48 -0700
From: Dany Madden <drt@linux.ibm.com>
To: Lijun Pan <lijunp213@gmail.com>
Subject: Re: [PATCH net-next] ibmvnic: Use list_for_each_entry() to simplify
 code in ibmvnic.c
In-Reply-To: <CAOhMmr4LQpX79ksQOuZ1ft=M2B4tFOPechV9b_5iJWWL1yekSA@mail.gmail.com>
References: <20210610125417.3834300-1-wanghai38@huawei.com>
 <CAOhMmr4LQpX79ksQOuZ1ft=M2B4tFOPechV9b_5iJWWL1yekSA@mail.gmail.com>
Message-ID: <cef4c1fc2c769c1463ba06b23c7e7d3c@imap.linux.ibm.com>
X-Sender: drt@linux.ibm.com
User-Agent: Roundcube Webmail/1.1.12
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qL_OelDesDuwWtwLzpz6pzFTPWWtDwMu
X-Proofpoint-ORIG-GUID: JDmX18QMSIhnX5N-5_HdB6m4xZdjcevx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_11:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=984 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100105
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
Cc: Wang Hai <wanghai38@huawei.com>, linux-kernel@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-06-10 07:52, Lijun Pan wrote:
> On Thu, Jun 10, 2021 at 7:56 AM Wang Hai <wanghai38@huawei.com> wrote:
>> 
>> Convert list_for_each() to list_for_each_entry() where
>> applicable. This simplifies the code.
>> 
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Wang Hai <wanghai38@huawei.com>
>> ---
> 
> Acked-by: Lijun Pan <lijunp213@gmail.com>
Reviewed-by: Dany Madden <drt@linux.ibm.com>
