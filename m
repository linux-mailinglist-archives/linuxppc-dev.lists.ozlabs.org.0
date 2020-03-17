Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6F188BB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 18:10:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hfnQ6t09zDqd2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=wAhJj7sO; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hf6t2Z5FzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:40:30 +1100 (AEDT)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02HGdjiB039777;
 Tue, 17 Mar 2020 16:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=T5tsVKMIG7XPMSHs9gjaBJJXCqRM0l5UsJSpLrAOiPA=;
 b=wAhJj7sOJdkPDno0zaw3Kue06mgis1jdpy8OU9v85Qt5TBtOrSKas2p20SLQ5i4HPxQh
 slxNXzkrnBSsTo3gwGc4JjeoGKiOufMNDsNeoJlQ/e3ZdHhNKuprpnEpKoEJBtEvO+/c
 2P6zR0I1pjG6jKLtIf7xN0Pt79y0/YeUd22ihF9XKlmM5q0WhlHaisQm08Cf8wgL5/wl
 PgRJselhgnyahk2p1F5iibiLbYYfhiI9d1L2d3laU49XQEIMYSqv82w9av1V8kGobVHY
 7AdzNnxDCvzXxhEh6A52+8qLXOGd4MjqaKSCKZCH/pr8uazZqhRTbsdqlHKHUlkUF264 kg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2yrqwn5w97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 16:40:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02HGOVbJ032830;
 Tue, 17 Mar 2020 16:40:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2ys8rf7kqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 16:40:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02HGe8bM003635;
 Tue, 17 Mar 2020 16:40:08 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Mar 2020 09:40:07 -0700
Subject: Re: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
To: Christophe Leroy <christophe.leroy@c-s.fr>, Baoquan He <bhe@redhat.com>
References: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
 <20200317082550.GA3375@MiWiFi-R3L-srv>
 <60117fd7-46ff-326b-34f1-0c7087111ca7@c-s.fr>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <a31c86c9-2f86-4f40-a367-5953037ee137@oracle.com>
Date: Tue, 17 Mar 2020 09:40:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <60117fd7-46ff-326b-34f1-0c7087111ca7@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170067
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003170067
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
Cc: Nick Piggin <npiggin@suse.de>, Andi Kleen <ak@suse.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, Adam Litke <agl@us.ibm.com>,
 Nishanth Aravamudan <nacc@us.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 1:43 AM, Christophe Leroy wrote:
> 
> 
> Le 17/03/2020 à 09:25, Baoquan He a écrit :
>> On 03/17/20 at 08:04am, Christophe Leroy wrote:
>>> When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
>>> following build failure is encoutered:
>>
>>  From the definition of HUGETLB_PAGE, isn't it relying on HUGETLBFS?
>> I could misunderstand the def_bool, please correct me if I am wrong.
> 
> AFAIU, it means that HUGETLBFS rely on HUGETLB_PAGE, by default HUGETLB_PAGE is not selected when HUGETLBFS is not. But it is still possible for an arch to select HUGETLB_PAGE without selecting HUGETLBFS when it uses huge pages for other purpose than hugetlb file system.
> 

Hi Christophe,

Do you actually have a use case/example of using hugetlb pages without
hugetlbfs?  I can understand that there are some use cases which never
use the filesystem interface.  However, hugetlb support is so intertwined
with hugetlbfs, I am thinking there would be issues trying to use them
separately.  I will look into this further.

-- 
Mike Kravetz
