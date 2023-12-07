Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41780883A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:45:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDXL2BkRz3vg4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVn2vp2z3d96
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVm6bFkz4xNG;
	Thu,  7 Dec 2023 23:44:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org, Li kunyu <kunyu@nfschina.com>
In-Reply-To: <20231113015229.12074-1-kunyu@nfschina.com>
References: <20231113015229.12074-1-kunyu@nfschina.com>
Subject: Re: [PATCH] misc: ocxl: main: Remove unnecessary ‘0’ values from rc
Message-Id: <170195271158.2310221.3721930020266501788.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Nov 2023 09:52:29 +0800, Li kunyu wrote:
> rc is assigned first, so it does not need to initialize the assignment.
> 
> 

Applied to powerpc/next.

[1/1] misc: ocxl: main: Remove unnecessary ‘0’ values from rc
      https://git.kernel.org/powerpc/c/29685ea5754f04c84ad443fd7c6869c68f636c26

cheers
