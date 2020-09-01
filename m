Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59E25A0E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 23:41:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh0qv5DSpzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 07:40:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mgq/rdcG; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh0nf0zpZzDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 07:38:59 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id n18so2141318qtw.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 14:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=0wt0Kuaq0tmnkhHuwXET4PhGnm4atGZXoNq5U4y8d/M=;
 b=mgq/rdcGU4bevby5Hlt3CzlEdoPTc7IOr4f0kpKR036Ghpq41mvUUOV242Sb4pegiq
 nItSycVWuRj25AVkilg7HiVX6yWHtvNqKc/xbxvV1DVxpzy6WEV5s+Op6iI2ERv6TKd3
 elYYhmNlsAaDgytzwWaXoAZtR6uVG2I9R7IKUfAlWxHZQwNJK01PR+jSMz3WHrc/PG0p
 SfDA3/1pDqN0mFjHMNwRCoN4uzhqQyfM447D4H8D7T9zJw7xrSy97m3UyzDhMnngAqw6
 E7ZlZF5hrX/SNnYanNGI8StgNmz9T+pBsqXw9fhKB7QNn0E1oPBDwqNWdm8cXcmagOMJ
 KKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=0wt0Kuaq0tmnkhHuwXET4PhGnm4atGZXoNq5U4y8d/M=;
 b=rGC5c29ZiGCssSPxJoVeOKel19HqU4qFVDrL1IKDdMhdjlR+skLG6yEe4bQsyPiFbx
 RHZLkJOGGA3K3h/A4hoLTOWnlm2O+U8HbpX64wNFHi/NRRY2snv+weNt/yTLSTlYM8Jn
 U2eX5tBeVtllxQWk9ByTGYE7uvN9ORxyrBl9iqcwC7CCeLE5ikjqrIlXJlPgIyBaiUGX
 IUAlVzlvCFtwRhavsywUBFoDhynL5c2TpjO7V/S8VDXyrhgP2X14KiAsCdCp4tF7ZMr5
 G1sCLvT41dEIXzx1WjkP+X9ndRzrjaEkjjfzMmxy2mFMJRWgetCuvYDcWz55MF8qc5wq
 J/bg==
X-Gm-Message-State: AOAM532kSleNRMHDkBGB46AnkTGSv6k9JGxlTVjXN9GK+WqP/H4W4Oq5
 3XrSSzA/vnXcfLkL3l2rgxE=
X-Google-Smtp-Source: ABdhPJwS5J9BIXwt+G+buetpCLmAXOFuR/gX5UAID4DPPAy7GpdTArczhpDIQAnFk4qy+5/xN7f1ew==
X-Received: by 2002:ac8:7246:: with SMTP id l6mr1816360qtp.145.1598996336093; 
 Tue, 01 Sep 2020 14:38:56 -0700 (PDT)
Received: from LeoBras (179-125-130-62.dynamic.desktop.com.br.
 [179.125.130.62])
 by smtp.gmail.com with ESMTPSA id w20sm2865190qki.108.2020.09.01.14.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:38:55 -0700 (PDT)
Message-ID: <c381d7e60d0924e432b0f36dce9a44b89733a129.camel@gmail.com>
Subject: Re: [PATCH v1 01/10] powerpc/pseries/iommu: Replace hard-coded page
 shift
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
Date: Tue, 01 Sep 2020 18:38:48 -0300
In-Reply-To: <1bba12c6-f1ec-9f1e-1d3e-c1efa5ceb7c7@ozlabs.ru>
References: <20200817234033.442511-1-leobras.c@gmail.com>
 <20200817234033.442511-2-leobras.c@gmail.com>
 <6232948f-033d-8322-e656-544f12c5f784@ozlabs.ru>
 <31e913d842693b6e107cb2b8e51fd45118b1bd2c.camel@gmail.com>
 <1e77a3d9-dff9-f58b-45be-77be7cbea41a@ozlabs.ru>
 <93037398c7afaabc0411890998f3f29f741c8aff.camel@gmail.com>
 <aaaf993a-d233-f5be-b809-5911a6a9872d@ozlabs.ru>
 <CAOSf1CG49ztvNoG43hcSHyLB9UY6Nc8maY_q6nvQmiyFQOAp3A@mail.gmail.com>
 <1bba12c6-f1ec-9f1e-1d3e-c1efa5ceb7c7@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 David Dai <zdai@linux.vnet.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-08-31 at 13:48 +1000, Alexey Kardashevskiy wrote:
> > > > Well, I created this TCE_RPN_BITS = 52 because the previous mask was a
> > > > hardcoded 40-bit mask (0xfffffffffful), for hard-coded 12-bit (4k)
> > > > pagesize, and on PAPR+/LoPAR also defines TCE as having bits 0-51
> > > > described as RPN, as described before.
> > > > 
> > > > IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figure 3.4 and 3.5.
> > > > shows system memory mapping into a TCE, and the TCE also has bits 0-51
> > > > for the RPN (52 bits). "Table 3.6. TCE Definition" also shows it.
> > > > In fact, by the looks of those figures, the RPN_MASK should always be a
> > > > 52-bit mask, and RPN = (page >> tceshift) & RPN_MASK.
> > > 
> > > I suspect the mask is there in the first place for extra protection
> > > against too big addresses going to the TCE table (or/and for virtial vs
> > > physical addresses). Using 52bit mask makes no sense for anything, you
> > > could just drop the mask and let c compiler deal with 64bit "uint" as it
> > > is basically a 4K page address anywhere in the 64bit space. Thanks,
> > 
> > Assuming 4K pages you need 52 RPN bits to cover the whole 64bit
> > physical address space. The IODA3 spec does explicitly say the upper
> > bits are optional and the implementation only needs to support enough
> > to cover up to the physical address limit, which is 56bits of P9 /
> > PHB4. If you want to validate that the address will fit inside of
> > MAX_PHYSMEM_BITS then fine, but I think that should be done as a
> > WARN_ON or similar rather than just silently masking off the bits.
> 
> We can do this and probably should anyway but I am also pretty sure we
> can just ditch the mask and have the hypervisor return an error which
> will show up in dmesg.

Ok then, ditching the mask.
Thanks!

