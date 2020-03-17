Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1830B188BFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 18:28:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hgBT6GMbzDqq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 04:28:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=vbIGY2kW; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hg8S1QZHzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 04:27:03 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02HHJ4f2127061;
 Tue, 17 Mar 2020 17:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=tmM036UedKoKmLv+RPQrJy6cg5QxGe0RJ3PRxmL1/ps=;
 b=vbIGY2kWpY9S82HDJ80TFO83/u93b2u2CKhJ6USynQnjbj427qLOKpp4/wup0FEN5k7t
 VMpH8ZQuWMW4DbsP+UAW9Ky2QV8hCzdDyAfT1jXG9t5uC676B82x7jrI5MbmhAXIvw+W
 xpEHH81IsBZgndFGmLF9mqUAt9tV2M8DtT+FUeNhHI8ENhipFbe54WHbydD1rKK9upep
 /Mc1epa6dE1vl+p++Nnu7OHptbJcCwJJu4T6r1rdlFHthOh7QClqvPfPCiY3+V4nMvN0
 U5sHnzbhT4jekpXh6pw164sQms6UBXlQmIdmE4NZTo8hQL76QuprbG0LaA5P2HIY4ctO NA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yrq7kx88b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 17:26:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02HHKjsl185935;
 Tue, 17 Mar 2020 17:24:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2ys8ts7c9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Mar 2020 17:24:51 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02HHOokm014044;
 Tue, 17 Mar 2020 17:24:51 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Mar 2020 10:24:50 -0700
Subject: Re: [PATCH] mm/hugetlb: Fix build failure with HUGETLB_PAGE but not
 HUGEBTLBFS
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nishanth Aravamudan <nacc@us.ibm.com>, Nick Piggin <npiggin@suse.de>,
 Adam Litke <agl@us.ibm.com>, Andi Kleen <ak@suse.de>
References: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <671b00e8-2a7a-6c19-b55b-ba2d6d0f5ad8@oracle.com>
Date: Tue, 17 Mar 2020 10:24:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7e8c3a3c9a587b9cd8a2f146df32a421b961f3a2.1584432148.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9563
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003170069
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/17/20 1:04 AM, Christophe Leroy wrote:
> When CONFIG_HUGETLB_PAGE is set but not CONFIG_HUGETLBFS, the
> following build failure is encoutered:
> 
> In file included from arch/powerpc/mm/fault.c:33:0:
> ./include/linux/hugetlb.h: In function 'hstate_inode':
> ./include/linux/hugetlb.h:477:9: error: implicit declaration of function 'HUGETLBFS_SB' [-Werror=implicit-function-declaration]
>   return HUGETLBFS_SB(i->i_sb)->hstate;
>          ^
> ./include/linux/hugetlb.h:477:30: error: invalid type argument of '->' (have 'int')
>   return HUGETLBFS_SB(i->i_sb)->hstate;
>                               ^
> 
> Gate hstate_inode() with CONFIG_HUGETLBFS instead of CONFIG_HUGETLB_PAGE.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Link: https://patchwork.ozlabs.org/patch/1255548/#2386036
> Fixes: a137e1cc6d6e ("hugetlbfs: per mount huge page sizes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

As hugetlb.h evolved over time, I suspect nobody imagined a configuration
with CONFIG_HUGETLB_PAGE and not CONFIG_HUGETLBFS.  This patch does address
the build issues.  So,

Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

However, there are many definitions in that file not behind #ifdef
CONFIG_HUGETLBFS that make no sense unless CONFIG_HUGETLBFS is defined.
Such cleanup is way beyond the scope of this patch/effort.  I will add
it to the list of hugetlb/hugetlbfs things that can be cleaned up.
-- 
Mike Kravetz
