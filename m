Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3354AD589
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 11:37:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtKFv3p57z3bbH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 21:37:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SXyshMjZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtKFH0VX6z2yws
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 21:36:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SXyshMjZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JtKFG4Phqz4xPv;
 Tue,  8 Feb 2022 21:36:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644316610;
 bh=hf/RiwV3a9oJVJJcMTWEesJnLe8hZVreYRJK1frPbiU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SXyshMjZil7ip21I82Yx/g9LajCp4wA2XSgiib4Y0LgbxOC8OnssQ5Ck9F9ftjjTH
 7Zerp9qjCiXgcDF19PF3REz1ZfY3Fsf7rawZ6pJHx7V5Qznq+FwIf9lXfEyuyJywKQ
 t+fY6n2JHTWMtxJPgTq/vAu+IvfXd20fXukOWCm7awFQfeHDjpQF1iaywwXMd+85wA
 twu8l6bjUrE68xIHlA+vwqP5DnrgfNG9OfwDifP3IeP51rkMGJR6ok8JQg7GsWvmQp
 fWHS5P8UTAhJh3XIn08VVMYvXXUnKpIfLEtcF6NLCNOQdU4yag1OxXPxm+cBfyWVDB
 jWnAOoXb30FTg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ritesh Harjani <riteshh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv2] selftests/powerpc/copyloops: Add memmove_64 test
In-Reply-To: <20220208035606.mxjd6k4jqswallxp@riteshh-domain>
References: <57242c1fe7aba6b7f0fcd0490303bfd5f222ee00.1631512686.git.riteshh@linux.ibm.com>
 <20220208035606.mxjd6k4jqswallxp@riteshh-domain>
Date: Tue, 08 Feb 2022 21:36:50 +1100
Message-ID: <87y22llk59.fsf@mpe.ellerman.id.au>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ritesh Harjani <riteshh@linux.ibm.com> writes:
> Found this, while checking my older emails. Sorry about not checking on this
> before. Have addressed the review comments here [1]
>
> This still applies cleanly on 5.17-rc3 and passes.
>
> riteshh-> ./copyloops/memmove_64
> test: memmove
> tags: git_version:v5.17-rc3-1-g84f773abc114
> success: memmove
>
> [1]: https://lore.kernel.org/all/87sfybl5f9.fsf@mpe.ellerman.id.au/

Thanks, I'll pick it up.

cheers
