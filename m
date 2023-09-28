Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39C7B29A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 02:39:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=APaa5kKk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxWgc2pXXz3dG0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 10:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=APaa5kKk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=steve.wahl@hpe.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1619 seconds by postgrey-1.37 at boromir; Fri, 29 Sep 2023 04:19:10 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxMFB3tlDz3cjk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 04:19:08 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38SHhHiB002198;
	Thu, 28 Sep 2023 17:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pps0720; bh=mZrC/t7ae+Z2o86iz704abLpUMsth0bb5IgGpyWjrnM=;
 b=APaa5kKkE4mpyTjbaPlvnbYIWIT9A784n1fDZhZsP48Q4BO9uSG32bZsfAF52jrU1bOT
 1h7DtIZq8CfCoiXJzZq8iCLGpdSe2PlQIjBXHSbzsrerYmN3AzKoVoUge3gno+oOKne0
 TZt5ZpPcmFxaL8khHe4Ax9IRzjtiszQvxqsciJsyNpAD6ZY84bLt17ZecVDpe5s/3MjB
 a3q5Nj2zzP41qNl43/8ndPzzA6qoqUz03rp+3yjfOcXzoZpJvReW4KIp/RtMFfifP+Ul
 Z6IbclgwAUZ5SJhoTsDmi8nxYS4v/OvpF1TAywHM0NXqhjlAEPK6WdmkxzbGRG8AthqO KA== 
Received: from p1lg14881.it.hpe.com ([16.230.97.202])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3tde4ur2yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 17:51:25 +0000
Received: from p1lg14885.dc01.its.hpecorp.net (unknown [10.119.18.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by p1lg14881.it.hpe.com (Postfix) with ESMTPS id A9CF8805E26;
	Thu, 28 Sep 2023 17:51:23 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.231.227.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by p1lg14885.dc01.its.hpecorp.net (Postfix) with ESMTPS id DAC6681566E;
	Thu, 28 Sep 2023 17:51:16 +0000 (UTC)
Date: Thu, 28 Sep 2023 12:51:15 -0500
From: Steve Wahl <steve.wahl@hpe.com>
To: j.granados@samsung.com
Subject: Re: [PATCH 11/15] sgi-xp: Remove the now superfluous sentinel
 element from ctl_table array
Message-ID: <ZRW9Eywl831h/YhW@swahl-home.5wahls.com>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <=?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <=?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=>
X-Proofpoint-GUID: ARXao25-avAoloITuhrfvukM5pXVcFhf
X-Proofpoint-ORIG-GUID: ARXao25-avAoloITuhrfvukM5pXVcFhf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_16,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280155
X-Mailman-Approved-At: Fri, 29 Sep 2023 10:31:49 +1000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, willy@infradead.org, Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd 
 Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-raid@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 28, 2023 at 03:21:36PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> 
> Remove sentinel from xpc_sys_xpc_hb and xpc_sys_xpc
> 
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  drivers/misc/sgi-xp/xpc_main.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
> index 6da509d692bb..c898092ff3ac 100644
> --- a/drivers/misc/sgi-xp/xpc_main.c
> +++ b/drivers/misc/sgi-xp/xpc_main.c
> @@ -109,8 +109,7 @@ static struct ctl_table xpc_sys_xpc_hb[] = {
>  	 .mode = 0644,
>  	 .proc_handler = proc_dointvec_minmax,
>  	 .extra1 = &xpc_hb_check_min_interval,
> -	 .extra2 = &xpc_hb_check_max_interval},
> -	{}
> +	 .extra2 = &xpc_hb_check_max_interval}
>  };
>  static struct ctl_table xpc_sys_xpc[] = {
>  	{
> @@ -120,8 +119,7 @@ static struct ctl_table xpc_sys_xpc[] = {
>  	 .mode = 0644,
>  	 .proc_handler = proc_dointvec_minmax,
>  	 .extra1 = &xpc_disengage_min_timelimit,
> -	 .extra2 = &xpc_disengage_max_timelimit},
> -	{}
> +	 .extra2 = &xpc_disengage_max_timelimit}
>  };
>  
>  static struct ctl_table_header *xpc_sysctl;
> 
> -- 
> 2.30.2
> 

I assume you'll match the rest of the changes with regards to the
trailing comma.

Reviewed-by: Steve Wahl <steve.wahl@hpe.com>

-- 
Steve Wahl, Hewlett Packard Enterprise
