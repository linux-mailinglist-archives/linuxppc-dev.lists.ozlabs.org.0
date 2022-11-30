Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD0E63D24F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZ7f29Ldz3gdW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:45:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtb6RY0z3fNP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:33:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtb4pnBz4xvZ;
	Wed, 30 Nov 2022 20:33:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Miehlbradt <nicholas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220810040321.375396-1-nicholas@linux.ibm.com>
References: <20220810040321.375396-1-nicholas@linux.ibm.com>
Subject: Re: [PATCH] docs: powerpc: add POWER9 and POWER10 to CPU families
Message-Id: <166980023112.3017288.5936742802883796497.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:51 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Aug 2022 04:03:21 +0000, Nicholas Miehlbradt wrote:
> Add POWER9 and POWER10 to CPU families and list Radix MMU.
> 
> 

Applied to powerpc/next.

[1/1] docs: powerpc: add POWER9 and POWER10 to CPU families
      https://git.kernel.org/powerpc/c/addebe1cfa71eb29caa9d5c6bc719171e4e76414

cheers
