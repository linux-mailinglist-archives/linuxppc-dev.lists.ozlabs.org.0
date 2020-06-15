Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0011F983B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:21:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lsRV17ldzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=Fq/hQ2DM; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrtb6j02zDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:56:20 +1000 (AEST)
Received: from zn.tnic (p200300ec2f063c0085fbd8d4455f52fc.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f06:3c00:85fb:d8d4:455f:52fc])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4813F1EC0328;
 Mon, 15 Jun 2020 14:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1592225759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=/AESQdNn9F5DJNAvN7Ekrb2QHr0FUj+XXTKW2C8uMmo=;
 b=Fq/hQ2DMKfbOxaJYqCYfztNBgi5oh0HsOx0x7L8VJ4cvNsn8HLUiHwhWxpSTqc4Eyh2BU2
 xRVbBQPrR+Rm8jodEQy0DsYSC7qHKiSva2/xftRAGym3Xdj+qsY8nQ7855vYkCCA2LEo2n
 0CXcuIWGshqqPcwJ9viqJNhwPGKSnlI=
Date: Mon, 15 Jun 2020 14:55:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v13 2/6] seq_buf: Export seq_buf_printf
Message-ID: <20200615125552.GI14668@zn.tnic>
References: <20200615124407.32596-1-vaibhav@linux.ibm.com>
 <20200615124407.32596-3-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200615124407.32596-3-vaibhav@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm@lists.01.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Christoph Hellwig <hch@infradead.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 06:14:03PM +0530, Vaibhav Jain wrote:
> 'seq_buf' provides a very useful abstraction for writing to a string
> buffer without needing to worry about it over-flowing. However even
> though the API has been stable for couple of years now its still not
> exported to kernel loadable modules limiting its usage.
> 
> Hence this patch proposes update to 'seq_buf.c' to mark
> seq_buf_printf() which is part of the seq_buf API to be exported to
> kernel loadable GPL modules. This symbol will be used in later parts
> of this patch-set to simplify content creation for a sysfs attribute.
> 
> Cc: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> 
> v12..v13:
> * None
> 
> v11..v12:
> * None

Can you please resend your patchset once a week like everyone else and
not flood inboxes with it?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
