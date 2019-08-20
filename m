Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A81496C41
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CltJ1W0bzDrG2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:32:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Clnn4Y2YzDrCW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 08:29:01 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DDC1B68BFE; Wed, 21 Aug 2019 00:28:56 +0200 (CEST)
Date: Wed, 21 Aug 2019 00:28:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 07/12] powerpc/mm: move ioremap_prot() into ioremap.c
Message-ID: <20190820222856.GD18433@lst.de>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
 <0b3eb0e0f1490a99fd6c983e166fb8946233f151.1566309262.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b3eb0e0f1490a99fd6c983e166fb8946233f151.1566309262.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 02:07:15PM +0000, Christophe Leroy wrote:
> Both ioremap_prot() are idenfical, move them into ioremap.c

s/idenfical/identical/
