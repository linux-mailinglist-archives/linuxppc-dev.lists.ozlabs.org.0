Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C536C4925EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 13:45:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdT535MNJz3bcg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 23:45:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XtNIwIa8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdT4R1Wglz3050
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 23:44:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XtNIwIa8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JdT4Q2g5yz4y3p;
 Tue, 18 Jan 2022 23:44:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642509878;
 bh=3HpsUpw7+GNqEHUAdgbr/9iPd9Kkotoh7+dN/nfDHxM=;
 h=From:To:Subject:Date:From;
 b=XtNIwIa8GhKooe69Db6sXARPk5LVimE4k25vgjHbZy6LgeI13KL/oJ2y5OKPvs2Uu
 hb0jGtlVPDWoZLWFhwCj2FPiUnk5PwgQ50dvYsTR+QB+awKopX3kvfyFevslQt3mIX
 yF8/MV0q8qk/F9wHnFZnjH6WLEpgomOQWveQqA4GXq6voC0KB4jOWn+eNyjF+kdN8Y
 3MBeFWJh/PRytcgSsgNecDkO/+WTfN3TfzTH/vmYmoWPOrugYXsPqJDDQWeX8gUWtg
 m612b+1KZaDdBisggUgxrnJd3E7WoN0UiJeRoRXtuZ9y8vQSwWxuLMI5TCy9cpjHl2
 8AvPmJw7BGPvA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Please backport b6b0d883bbb8 to v5.10
Date: Tue, 18 Jan 2022 23:44:35 +1100
Message-ID: <87lezd1ado.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

Could you please backport:

  b6b0d883bbb8 ("powerpc/pseries: Get entry and uaccess flush required bits from H_GET_CPU_CHARACTERISTICS")

to the v5.10 stable kernel. Thanks.

cheers
