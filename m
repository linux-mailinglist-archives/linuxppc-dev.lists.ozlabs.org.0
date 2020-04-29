Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9980B1BE42D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:43:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C48m3sVHzDrCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 02:43:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=wei.liu.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C46f11XyzDr7V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 02:42:01 +1000 (AEST)
Received: by mail-wm1-f65.google.com with SMTP id k12so2781614wmj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 09:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b1NmnG+Bha+R6DCsicsXkjR18of0wt/SYtjmCqwDrqU=;
 b=LGlrjnHCMXW/8vtAPep6TSmt8vaDCwV2ep/ibp3QTSP5mLSLpxcOCu8repL4WLD8Qg
 eyqZg4dZLitSADmCthtFJMDtSsZIfyNEgCLMU9FchQcsgCYqq6gS8vXgjq4uKNmDU7oF
 lpcYZn3DHCbCibaRlNkQkR29M029MDXyQyjGMR9dZJilWRqT0oD+ZNR3LQ5iPV3FaWzQ
 LwWHnVR8bJnDvUqEVvHG/673P3KRKpwjeGVC7XNWQqlcxxBIuRoLkKCF6SngyHkd+TSm
 54tE/B1eJ4hzmjRZX3E0zpWpcseFsCHCIuHU6p3BdbVwivrR9rjq/XGCcnZ+N9aibH8t
 gdAg==
X-Gm-Message-State: AGi0PuY/xdcFtjdU1x+6tAsEfGK5aiMM7LWw59TsJ1bseNGYaR7A9o2w
 QQhszSO0rIgMrYTbf22uDXA=
X-Google-Smtp-Source: APiQypK92COmCk6jtDXQuM8RbqIzlQmTZkmvIjtD7/GMtqebIJTWbJ+7ip3K+A9bRbw+AFyvMNQEDw==
X-Received: by 2002:a1c:2383:: with SMTP id j125mr4175112wmj.6.1588178518352; 
 Wed, 29 Apr 2020 09:41:58 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i25sm8360761wml.43.2020.04.29.09.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 09:41:57 -0700 (PDT)
Date: Wed, 29 Apr 2020 16:41:55 +0000
From: Wei Liu <wei.liu@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm/memory_hotplug: Prepare passing flags to
 add_memory() and friends
Message-ID: <20200429164154.ctflq4ouwrwwe4wq@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200429160803.109056-1-david@redhat.com>
 <20200429160803.109056-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429160803.109056-2-david@redhat.com>
User-Agent: NeoMutt/20180716
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
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Pingfan Liu <kernelfans@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, virtio-dev@lists.oasis-open.org,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Baoquan He <bhe@redhat.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-acpi@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 xen-devel@lists.xenproject.org, Len Brown <lenb@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Leonardo Bras <leobras.c@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Oscar Salvador <osalvador@suse.de>, Juergen Gross <jgross@suse.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Eric Biederman <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 29, 2020 at 06:08:01PM +0200, David Hildenbrand wrote:
> We soon want to pass flags - prepare for that.
> 
> This patch is based on a similar patch by Oscar Salvador:
> 
> https://lkml.kernel.org/r/20190625075227.15193-3-osalvador@suse.de
> 
[...]
> ---
>  drivers/hv/hv_balloon.c                         |  2 +-

> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index 32e3bc0aa665..0194bed1a573 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -726,7 +726,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
>  
>  		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
>  		ret = add_memory(nid, PFN_PHYS((start_pfn)),
> -				(HA_CHUNK << PAGE_SHIFT));
> +				(HA_CHUNK << PAGE_SHIFT), 0);
>  
>  		if (ret) {
>  			pr_err("hot_add memory failed error is %d\n", ret);

Acked-by: Wei Liu <wei.liu@kernel.org>
