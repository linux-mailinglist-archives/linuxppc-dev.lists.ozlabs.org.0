Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B29E69D3C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 18:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HHCt18tkzDqC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGqt3BgRzDqXm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:58:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GBnmuK7P"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HGqt0cpxz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:58:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HGqs6hKLz9sN1; Tue, 27 Aug 2019 01:58:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="GBnmuK7P"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46HGqs0xcsz9sBF;
 Tue, 27 Aug 2019 01:57:59 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C369620828;
 Mon, 26 Aug 2019 15:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566835077;
 bh=blUYG8ZxI4V85CCdRu6wwyVrWFwoe8m7ktk5ZMl8OdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GBnmuK7Pv1FZCHS+Livxfezz4rL3sDkZZ+RwyLnRlwoMa56BTxvqZOBdxs42Yh5op
 S7+MjUjLraULqNWCgT8f0CmoKTO/dSXf0J4YVUptakeIlhn5aaHGbrE7EvuvmMJgGo
 Gm1Oj30vyfO98acaBe7IC1QYe6ai1wJhWrAZVl5A=
Date: Mon, 26 Aug 2019 17:57:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 2/4] powerpc: expose secure variables to userspace via
 sysfs
Message-ID: <20190826155754.GA489@kroah.com>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
 <20190826145649.GA27342@kroah.com>
 <2c5b8ba3-e5a3-5c80-a291-ea9965db2019@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c5b8ba3-e5a3-5c80-a291-ea9965db2019@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 11:46:11AM -0400, Nayna wrote:
> 
> 
> On 08/26/2019 10:56 AM, Greg Kroah-Hartman wrote:
> > On Mon, Aug 26, 2019 at 09:23:36AM -0400, Nayna Jain wrote:
> > > +static struct kobj_attribute size_attr = __ATTR_RO(size);
> > Wait, why not just normal ATTR_RO()?
> 
> Oh!! Sorry. I am not seeing this macro in sysfs.h. am I missing something ?

Ugh, no, you are right, I thought it was there as the BIN_ATTR_RO() one
was there :)

> > > +static struct bin_attribute data_attr = __BIN_ATTR_RO(data, VARIABLE_MAX_SIZE);
> > And BIN_ATTR_RO() here?
> 
> This would have worked. I think I just thought to use the same way as
> __ATTR_RO().

Yes, that's fine to use, sorry for the noise.

greg k-h
