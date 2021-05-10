Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737C3793C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 18:28:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff61r1bZHz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 02:28:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256 header.s=20200525 header.b=iF95FesF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=deltatee.com (client-ip=204.191.154.188; helo=ale.deltatee.com;
 envelope-from=logang@deltatee.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=deltatee.com header.i=@deltatee.com header.a=rsa-sha256
 header.s=20200525 header.b=iF95FesF; dkim-atps=neutral
X-Greylist: delayed 1822 seconds by postgrey-1.36 at boromir;
 Tue, 11 May 2021 02:28:22 AEST
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff61L3LcWz2xZP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 02:28:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=PJ2TGMvunRgbLOMNaLpECMSQ7u+Yoj2zFlT7elV+KXg=; b=iF95FesFen2c6YLjciyAoIBsi5
 J7XzAI4MZig/8h2TwJXt0gy3lQhhWVfjR28C4e5crYdi9FcxISSMCGWbl5L8wXf3Fn0UHJ77IVaTu
 tUtVsHZlHpGL2HlrpG3ucLy4CeMXt73BP+DV3oPeUxEyN0dxckYtGN54nvTn0Jl4unXTe5lMvMGhd
 lzFGNzUnRlDk89iujq2AosZ6G6pJMNPR655ee9POyI/IJnRDrT80+RuhtdIZXhwWmtuwt3Spg1Ej4
 34cacB/8bgwuc7M5wCmk4QxoCe/yB40DFMWSl0ig5TowVG+B6rvWWD9nXSDlaBP6GbV7DZZ5H3faF
 GqnPNBkA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1lg8I5-0001nE-Ql; Mon, 10 May 2021 09:57:54 -0600
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
References: <20210510041424.233565-1-kw@linux.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <4557364b-76ce-3555-e97d-14f39eda27b8@deltatee.com>
Date: Mon, 10 May 2021 09:57:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510041424.233565-1-kw@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 kurt.schwemmer@microsemi.com, ruscur@russell.cc, tyreld@linux.ibm.com,
 paulus@samba.org, benh@kernel.crashing.org, mpe@ellerman.id.au,
 oohall@gmail.com, bhelgaas@google.com, kw@linux.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE,NICE_REPLY_A autolearn=ham autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH 01/11] PCI: Use sysfs_emit() and sysfs_emit_at() in "show"
 functions
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
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021-05-09 10:14 p.m., Krzysztof Wilczyński wrote:
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

Thanks, this is a great cleanup. I've reviewed the entire series.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

I agree that the new lines that are missing should be added.

Logan
