Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E868563DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFZH6Spmz3vd7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:01:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX50s8Wz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX46K0gz4wxv;
	Thu, 15 Feb 2024 23:59:48 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20240202-papr-sysparm-ioblock-data-use-u8-v1-1-f5c6c89f65ec@linux.ibm.com>
References: <20240202-papr-sysparm-ioblock-data-use-u8-v1-1-f5c6c89f65ec@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/papr-sysparm: use u8 arrays for payloads
Message-Id: <170800185779.599237.9578956703101401528.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 02 Feb 2024 18:26:46 -0600, Nathan Lynch wrote:
> Some PAPR system parameter values are formatted by firmware as
> nul-terminated strings (e.g. LPAR name, shared processor attributes).
> But the values returned for other parameters, such as processor module
> info and TLB block invalidate characteristics, are binary data with
> parameter-specific layouts. So char[] isn't the appropriate type for
> the general case. Use u8/__u8.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/papr-sysparm: use u8 arrays for payloads
      https://git.kernel.org/powerpc/c/8ded03ae48b3657e0fbca99d8a9d8fa1bfb8c9be

cheers
