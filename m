Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC32130664
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2020 08:04:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47r8lP2zV6zDqCl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jan 2020 18:04:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="qeY1BTDv"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47r8jM4M2QzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jan 2020 18:02:46 +1100 (AEDT)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D18BF20866;
 Sun,  5 Jan 2020 07:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578207763;
 bh=N3XRiR7CmsQsVRLAZucAVOasILmNQQtZLni2nmDCmMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qeY1BTDvcMglSfXPB93lsmipOPUh4PNjZC6fWuH5QzMqHnAPA3+2hlmcdx+b1gRzJ
 lVvv+2qHHqoS5jJwn8LfdfPQ5omY1KB3swSZcxqQ0Nd5/OhBvhqlldib8qkKniVQEx
 DU4N5PvpX68p/g65Qjsoli11Bf62jl1BtfpwHj9g=
Date: Sun, 5 Jan 2020 09:02:37 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: add support for folded p4d page tables
Message-ID: <20200105070236.GA7261@rapoport-lnx>
References: <20191209150908.6207-1-rppt@kernel.org>
 <20200102081059.GA12063@rapoport-lnx>
 <20200102174231.Horde.vA_c3sSHB1vhx2H9Ce-i9Q1@messagerie.si.c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200102174231.Horde.vA_c3sSHB1vhx2H9Ce-i9Q1@messagerie.si.c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 02, 2020 at 05:42:31PM +0100, Christophe Leroy wrote:
> Mike Rapoport <rppt@kernel.org> a écrit :
> 
> >Any updates on this?
> 
> Checkpatch reported several points, see
> https://patchwork.ozlabs.org/patch/1206344/

Well, for the most part checkpatch is unhappy because I've tried to keep
the changes consistent with the old code. And, there are some lines over 90
characters that do no seem worth breaking.

> Christophe
> 
