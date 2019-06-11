Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A7B3D6C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 21:25:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ng1g3rHKzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 05:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=141.146.126.79; helo=aserp2130.oracle.com;
 envelope-from=khalid.aziz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="lyKS8EPY"; 
 dkim-atps=neutral
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nfzf1m3dzDqpJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 05:23:09 +1000 (AEST)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJEZF2148131;
 Tue, 11 Jun 2019 19:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=w76MFlwvNKhZqtHwJRAkKoCnG/0YMyc0k1SshiGhIFo=;
 b=lyKS8EPYtHVV69hKRhxbZ6v/wFBGKQdRKMFGV75IF5Ly8f4gx63IiVxb73DDl0+AbJmm
 CdJvjrw/0ON/ZIZZDVd35XGZGYcOr6YUm+1+c4fVLRIbczJKiRbuQsnnHiPmGT32HeMI
 yPgGH8BMtCJNcZGgeKqNc9zQymR1ehBB6hPaiWuv6zwujyXlG+0dhRPfn5KJWPXSEiiY
 86sDUCAy3UJthE28Vd8oZg8tOUjk962pLYKGbyc4eo09yWsg8uiILcyco70X+7o/NVSy
 0l1s88pzby/RchV3V0Lwt3GnLLHzR1ZcAlylaXvzBxfsoWFdW5Th0f/oeh7B7jYF2E0Y MQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2t02heqdfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 19:22:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BJLICV095933;
 Tue, 11 Jun 2019 19:22:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2t024uk1m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 19:22:41 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5BJMawp024319;
 Tue, 11 Jun 2019 19:22:36 GMT
Received: from [10.154.187.61] (/10.154.187.61)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 12:22:36 -0700
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
To: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <9145f3f9-4e14-df6a-87f5-663ad197e96e@oracle.com>
Date: Tue, 11 Jun 2019 13:22:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611144102.8848-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=920
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110123
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=962 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110123
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/19 8:40 AM, Christoph Hellwig wrote:
> This will allow sparc64 to override its ADI tags for
> get_user_pages and get_user_pages_fast.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Commit message is sparc64 specific but the goal here is to allow any
architecture with memory tagging to use this. So I would suggest
rewording the commit log. Other than that:

Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>

>  mm/gup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index ddde097cf9e4..6bb521db67ec 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, in=
t nr_pages, int write,
>  	unsigned long flags;
>  	int nr =3D 0;
> =20
> -	start &=3D PAGE_MASK;
> +	start =3D untagged_addr(start) & PAGE_MASK;
>  	len =3D (unsigned long) nr_pages << PAGE_SHIFT;
>  	end =3D start + len;
> =20
> @@ -2219,7 +2219,7 @@ int get_user_pages_fast(unsigned long start, int =
nr_pages,
>  	unsigned long addr, len, end;
>  	int nr =3D 0, ret =3D 0;
> =20
> -	start &=3D PAGE_MASK;
> +	start =3D untagged_addr(start) & PAGE_MASK;
>  	addr =3D start;
>  	len =3D (unsigned long) nr_pages << PAGE_SHIFT;
>  	end =3D start + len;
>=20


