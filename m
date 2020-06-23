Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C634204741
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 04:28:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rVYy14syzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 12:28:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kuMyxAtE; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rVXG0LMrzDqCM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 12:26:36 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id o5so21854045iow.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 19:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=JeBmgi5MEU9b+rC0zQ3g7Frqafi6s+x5xwkR37z5J/o=;
 b=kuMyxAtE429gbGKXs0yUURMUEj8Hut2RFZVRENPJF3jlOe6Ds+dkGCciDFkXcN1PVl
 pDNAda3WUwYjYV18kbZmesCbBwZbFsRAfWELdIJnNsqHXuFMuuPuSdWfAdv9OKT7uM8P
 UhP46VwtRtf+l4iSvS8JA6dM7ISulkwizRImkHuvmB+MX9Hljvm5GfB1HBotPbU0TVm6
 cM8JdfD7WIMcvJdFVOkW8GGFAP4XQTEX7iOTtop6NhkDQ+RY0OcPm4VTLV3uDXhpmEb9
 ftVgDW7m8yjRQhxrQH1L9GJQ+GjumtTTyrBcP+Rb8i7PH7gb9BorHO9Hkx1QykEUOVT7
 oaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=JeBmgi5MEU9b+rC0zQ3g7Frqafi6s+x5xwkR37z5J/o=;
 b=Vz9wsWUHIXMH6cd/rfNpe+wR7w48+ziW5DDsBj8Mrfcc6vjsbCRgJceOMYigghUBU4
 iktXM9yXSGAF5/j3Dh+TXRkCZxG1imctbgM6zQHfDRVaEpVsc4tou2jpFZAfNbFMO+7r
 ZgLghTySR63gWX25L3+QnVko5ozWoY9gf0M4RpcfGXwDp11QHyRO5qClMaF4OsAMyv0e
 QUdOB4L0svHtivz//Y4FocTZsQ4m8UrYsoVgBj4FPdu41fprjodtxFugFOKKqPle+okf
 FCJRvs5U7GnpLcN9NA2BjpgcqCQemcY0qXpYndVjPqylceCdhsUkBDL+h0hSwISK/hL3
 OzWA==
X-Gm-Message-State: AOAM530FF1p039XJN+1Fmzu0m/UAREf7/KadZnuT50+vwQlJ0Ued1Am7
 0GGRUietdFMWg00V1M8VnsS9mkgY
X-Google-Smtp-Source: ABdhPJyQH5TToRDJNIWo9OFfkuK/CeUceNCneJXJeV7ZfMXiwI0JilEJ+A7umu/uvQnAfannLgWGBQ==
X-Received: by 2002:a5d:8905:: with SMTP id b5mr1165806ion.95.1592879192981;
 Mon, 22 Jun 2020 19:26:32 -0700 (PDT)
Received: from LeoBras (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id w16sm8787996iom.27.2020.06.22.19.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 19:26:32 -0700 (PDT)
Message-ID: <de68e4ed43f802624b5403b548557084ee63e325.camel@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
From: Leonardo Bras <leobras.c@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Mon, 22 Jun 2020 23:26:18 -0300
In-Reply-To: <CAOSf1CEC-tYH1so5b4P7dQ7s8v1o4qy_u5CG7LKtKNnRQvC4-w@mail.gmail.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-4-leobras.c@gmail.com>
 <51201582-efe5-85df-7e65-a998e91ab63f@ozlabs.ru>
 <ccf7b591f2bf61ba4705699b2e2b050c3cf48d99.camel@gmail.com>
 <887bf30e-ae9e-b0cb-0388-dc555692ff0a@ozlabs.ru>
 <CAOSf1CEC-tYH1so5b4P7dQ7s8v1o4qy_u5CG7LKtKNnRQvC4-w@mail.gmail.com>
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
Cc: Ram Pai <linuxram@us.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-06-23 at 11:33 +1000, Oliver O'Halloran wrote:
> On Tue, Jun 23, 2020 at 11:12 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> > On 23/06/2020 04:59, Leonardo Bras wrote:
> > > > Also, despite this particular file, the "pdn" name is usually used for
> > > > struct pci_dn (not device_node), let's keep it that way.
> > > 
> > > Sure, I got confused for some time about this, as we have:
> > > static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn).
> > > but on *_ddw() we have "struct pci_dn *pdn".
> > 
> > True again, not the cleanest style here.
> > 
> > 
> > > I will also add a patch that renames those 'struct device_node *pdn' to
> > > something like 'struct device_node *parent_dn'.
> 
> I usually go with "np" or "node". In this case I'd use "parent_np" or
> just "parent." As you said pci_dn conventionally uses pdn so that
> should be avoided if at all possible. There's some places that just
> use "dn" for device_node, but I don't think that's something we should
> encourage due to how similar it is to pdn.

Sure, I will try that.

> 
> > I would not go that far, we (well, Oliver) are getting rid of many
> > occurrences of pci_dn and Oliver may have a stronger opinion here.
> 
> I'm trying to remove the use of pci_dn from non-RTAS platforms which
> doesn't apply to pseries. For RTAS platforms having pci_dn sort of
> makes sense since it's used to cache data from the device_node and
> having it saves you from needing to parse and validate the DT at
> runtime since we're supposed to be relying on the FW provided settings
> in the DT. I want to get rid of it on PowerNV because it's become a
> dumping ground for random bits and pieces of platform specific data.
> It's confusing at best and IMO it duplicates a lot of what's already
> available in the per-PHB structures which the platform specific stuff
> should actually be looking at.
> 
> Oliver

Best regards,
Leonardo Bras

