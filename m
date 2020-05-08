Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466C1CA9A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 13:32:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JSqq3tkrzDr6w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 21:32:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=ajKU+NyT; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JSnr6hNYzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 21:31:12 +1000 (AEST)
Received: from zn.tnic (p200300EC2F0C9800329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:9800:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 66CAE1EC01E3;
 Fri,  8 May 2020 13:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1588937464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=1eqM0KO/acjhJgPqNx4KEjCLmfTHlkhC1fqE3NZnZhA=;
 b=ajKU+NyT9keoUt6VtrKMZVtvSJnvzuys44mYcAxyAE6kH9yzR/PrzP3uFRBt+pp8A8FVyU
 E78wCnGj0NbBySbEgAeq3zHanzqf4Zyq+QHBw2qGNAXgpycgeZvEP3xnORYihiuQwo7xgg
 dbJ72zHeXEVGMH005McwoEY0lgLmS+g=
Date: Fri, 8 May 2020 13:31:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v7 2/5] seq_buf: Export seq_buf_printf() to external
 modules
Message-ID: <20200508113100.GA19436@zn.tnic>
References: <20200508104922.72565-1-vaibhav@linux.ibm.com>
 <20200508104922.72565-3-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200508104922.72565-3-vaibhav@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 08, 2020 at 04:19:19PM +0530, Vaibhav Jain wrote:
> 'seq_buf' provides a very useful abstraction for writing to a string
> buffer without needing to worry about it over-flowing. However even
> though the API has been stable for couple of years now its stills not
> exported to external modules limiting its usage.
> 
> Hence this patch proposes update to 'seq_buf.c' to mark
> seq_buf_printf() which is part of the seq_buf API to be exported to
> external GPL modules. This symbol will be used in later parts of this

What is "external GPL modules"?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
