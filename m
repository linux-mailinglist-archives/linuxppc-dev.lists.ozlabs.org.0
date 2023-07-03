Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7928745518
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:53:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZpR6CY7z3c3f
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:53:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZnz0jhfz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:52:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZny4Dynz4wb5;
	Mon,  3 Jul 2023 15:52:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-integrity <linux-integrity@vger.kernel.org>, Nayna Jain <nayna@linux.ibm.com>
In-Reply-To: <20230608120444.382527-1-nayna@linux.ibm.com>
References: <20230608120444.382527-1-nayna@linux.ibm.com>
Subject: Re: [PATCH v2] security/integrity: fix pointer to ESL data and its size on pseries
Message-Id: <168836201899.50010.16718457510538394042.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Nageswara R Sastry <rnsastry@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Russell Currey <ruscur@russell.cc>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 08 Jun 2023 08:04:44 -0400, Nayna Jain wrote:
> On PowerVM guest, variable data is prefixed with 8 bytes of timestamp.
> Extract ESL by stripping off the timestamp before passing to ESL parser.
> 
> 

Applied to powerpc/next.

[1/1] security/integrity: fix pointer to ESL data and its size on pseries
      https://git.kernel.org/powerpc/c/e66effaf61ffb1dc6088492ca3a0e98dcbf1c10d

cheers
