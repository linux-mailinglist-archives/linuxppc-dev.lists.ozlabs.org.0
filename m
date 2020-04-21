Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF11B1FC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 09:28:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495wD848VrzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 17:28:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495wBb5dHyzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 17:27:35 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jQnFN-0005gp-BL; Tue, 21 Apr 2020 02:23:09 -0500
Message-ID: <876d477d6d8db20c41be3eb59850c51e6badbfcf.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Wang Wenhu <wenhu.wang@vivo.com>, gregkh@linuxfoundation.org,
 arnd@arndb.de,  linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Tue, 21 Apr 2020 02:23:08 -0500
In-Reply-To: <20200420030538.101696-1-wenhu.wang@vivo.com>
References: <20200420030538.101696-1-wenhu.wang@vivo.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: wenhu.wang@vivo.com, gregkh@linuxfoundation.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kernel@vivo.com, robh@kernel.org, christophe.leroy@c-s.fr, mpe@ellerman.id.au,
 rdunlap@infradead.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v2,RESEND] misc: new driver sram_uapi for user level
 SRAM access
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: kernel@vivo.com, Randy Dunlap <rdunlap@infradead.org>, robh@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2020-04-19 at 20:05 -0700, Wang Wenhu wrote:
> +static void sram_uapi_res_insert(struct sram_uapi *uapi,
> +				 struct sram_resource *res)
> +{
> +	struct sram_resource *cur, *tmp;
> +	struct list_head *head = &uapi->res_list;
> +
> +	list_for_each_entry_safe(cur, tmp, head, list) {
> +		if (&tmp->list != head &&
> +		    (cur->info.offset + cur->info.size + res->info.size <=
> +		    tmp->info.offset)) {
> +			res->info.offset = cur->info.offset + cur->info.size;
> +			res->parent = uapi;
> +			list_add(&res->list, &cur->list);
> +			return;
> +		}
> +	}

We don't need yet another open coded allocator.  If you really need to do this
then use include/linux/genalloc.h, but maybe keep it simple and just have one
allocaton per file descriptor so you don't need to manage fd offsets?

> +static struct sram_resource *sram_uapi_find_res(struct sram_uapi *uapi,
> +						__u32 offset)
> +{
> +	struct sram_resource *res;
> +
> +	list_for_each_entry(res, &uapi->res_list, list) {
> +		if (res->info.offset == offset)
> +			return res;
> +	}
> +
> +	return NULL;
> +}

What if the allocation is more than one page, and the user mmaps starting
somewhere other than the first page?

> +	switch (cmd) {
> +	case SRAM_UAPI_IOC_SET_SRAM_TYPE:
> +		if (uapi->sa)
> +			return -EEXIST;
> +
> +		get_user(type, (const __u32 __user *)arg);
> +		uapi->sa = get_sram_api_from_type(type);
> +		if (uapi->sa)
> +			ret = 0;
> +		else
> +			ret = -ENODEV;
> +
> +		break;
> +

Just expose one device per backing SRAM, especially if the user has any reason
to care about where the SRAM is coming from (correlating sysfs nodes is much
more expressive than some vague notion of "type").

> +	case SRAM_UAPI_IOC_ALLOC:
> +		if (!uapi->sa)
> +			return -EINVAL;
> +
> +		res = kzalloc(sizeof(*res), GFP_KERNEL);
> +		if (!res)
> +			return -ENOMEM;
> +
> +		size = copy_from_user((void *)&res->info,
> +				      (const void __user *)arg,
> +				      sizeof(res->info));
> +		if (!PAGE_ALIGNED(res->info.size) || !res->info.size)
> +			return -EINVAL;

Missing EFAULT test (here and elsewhere), and res leaks on error.

> +
> +		res->virt = (void *)uapi->sa->sram_alloc(res->info.size,
> +							 &res->phys,
> +							 PAGE_SIZE);

Do we really need multiple allocators, or could the backend be limited to just
adding regions to a generic allocator (with that allocator also serving in-
kernel users)?

If sram_alloc is supposed to return a virtual address, why isn't that the
return type?

> +		if (!res->virt) {
> +			kfree(res);
> +			return -ENOMEM;
> +		}

ENOSPC might be more appropriate, as this isn't general-purpose RAM.

> +
> +		sram_uapi_res_insert(uapi, res);
> +		size = copy_to_user((void __user *)arg,
> +				    (const void *)&res->info,
> +				    sizeof(res->info));
> +
> +		ret = 0;
> +		break;
> +
> +	case SRAM_UAPI_IOC_FREE:
> +		if (!uapi->sa)
> +			return -EINVAL;
> +
> +		size = copy_from_user((void *)&info, (const void __user *)arg,
> +				      sizeof(info));
> +
> +		res = sram_uapi_res_delete(uapi, &info);
> +		if (!res) {
> +			pr_err("error no sram resource found\n");
> +			return -EINVAL;
> +		}
> +
> +		uapi->sa->sram_free(res->virt);
> +		kfree(res);
> +
> +		ret = 0;
> +		break;

So you can just delete any arbitrary offset, even if you weren't the one that
allocated it?  Even if this isn't meant for unprivileged use it seems error-
prone.  

> +
> +	default:
> +		pr_err("error no cmd not supported\n");
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int sram_uapi_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct sram_uapi *uapi = filp->private_data;
> +	struct sram_resource *res;
> +
> +	res = sram_uapi_find_res(uapi, vma->vm_pgoff);
> +	if (!res)
> +		return -EINVAL;
> +
> +	if (vma->vm_end - vma->vm_start > res->info.size)
> +		return -EINVAL;
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +
> +	return remap_pfn_range(vma, vma->vm_start,
> +			       res->phys >> PAGE_SHIFT,
> +			       vma->vm_end - vma->vm_start,
> +			       vma->vm_page_prot);
> +}

Will noncached always be what's wanted here?

-Scott


