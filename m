Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4C38380D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 17:48:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkNpJ1fmkz2ymM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 01:48:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=ZROh44oG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com;
 envelope-from=logang@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256
 header.s=20200525 header.b=ZROh44oG; dkim-atps=neutral
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkNnr0jfVz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 01:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=ci0Z22X/hoUCHCY6WnDB2dAMsmpgRh0tkZ7xIAwR5oQ=; b=ZROh44oGIOWHIEbPhglpJZHKyK
 9zxWS2ovHdp9PqkLdpI7RAWV2Z7E6OzokO/5vDTl6c8SKJPLAHtISlAzzGIefD63MWLFHs6r5w7jI
 cZMD7IvJYj7yLMuDO1+mNEOcttjt4M0C+5iAnCg2n9/eWCDrlI1GEH6Ee6dEt5PE/ZuFWb/e/g9eD
 GZZ+yiM7mRGipZZZE/TJGO3RRbaN3hTIEwtKvdSmNO/RyUtYCQKAg7JIwuSVv+1bsPelWmdoM+Oot
 LigEENaTOjx1bour1QPVDvAMUQ67u1fbXcTGjqCNDovWIm0Uf5MV518CpKjzZDzCnm19Vs0bn9e6r
 nvm8AJ+g==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lifTU-0001Xm-KS; Mon, 17 May 2021 09:48:09 -0600
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20210515052434.1413236-1-kw@linux.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <b3be37d4-5d98-474e-05ca-afce4782c359@deltatee.com>
Date: Mon, 17 May 2021 09:48:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515052434.1413236-1-kw@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 wangxiongfeng2@huawei.com, vidyas@nvidia.com, kurt.schwemmer@microsemi.com,
 ruscur@russell.cc, tyreld@linux.ibm.com, paulus@samba.org,
 benh@kernel.crashing.org, mpe@ellerman.id.au, oohall@gmail.com,
 joe@perches.com, bhelgaas@google.com, kw@linux.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE,NICE_REPLY_A autolearn=ham autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH v2 01/14] PCI: Use sysfs_emit() and sysfs_emit_at() in
 "show" functions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 Vidya Sagar <vidyas@nvidia.com>, Oliver O'Halloran <oohall@gmail.com>,
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, linuxppc-dev@lists.ozlabs.org,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021-05-14 11:24 p.m., Krzysztof Wilczyński wrote:
> The sysfs_emit() and sysfs_emit_at() functions were introduced to make
> it less ambiguous which function is preferred when writing to the output
> buffer in a device attribute's "show" callback [1].
> 
> Convert the PCI sysfs object "show" functions from sprintf(), snprintf()
> and scnprintf() to sysfs_emit() and sysfs_emit_at() accordingly, as the
> latter is aware of the PAGE_SIZE buffer and correctly returns the number
> of bytes written into the buffer.
> 
> No functional change intended.
> 
> [1] Documentation/filesystems/sysfs.rst
> 
> Related to:
>   commit ad025f8e46f3 ("PCI/sysfs: Use sysfs_emit() and sysfs_emit_at() in "show" functions")
> 
> Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

I re-reviewed the whole series. It still looks good to me.

Very nice solution in patch 12 to the new line issue.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks,

Logan
