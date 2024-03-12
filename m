Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36B87923E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 11:36:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fSkUOcUx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv96f6yqyz3vX1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 21:36:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fSkUOcUx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv95v3xGYz3cN6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 21:35:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710239743;
	bh=RZEfYiLTkNnDL11Vo6sbxwGAoRDVBPoFLJr3cr56jVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fSkUOcUxT9cjPVrU6sP8jJWYfWnjxzJLfKf1w6I4iWC+czN6ATNMjWO3u4Ol/6NIA
	 klGcwVNW/8svX8Sa0TDuNXmzpmRaIWCIIJiAZwux8+TQ3uC3zJKgS+4d8VliKauaaY
	 QdI3599p5DxoYz1/zN+FEVUnepZ4ntyegPliodd6Q0GAAbzech0kGB5Sx2JeG/YXdz
	 RK3wuxQVdXT+La7rI/Bh4+uNV4SHIuCZXcVn2QbzLvPia4W0BFpkoWtyvQOi29Hrqo
	 QNBAi86yP7jeyw45oqpE9N7aCxKKaxoPn9m8zJIHkxcpuba/Z1fMqcONSLaWpLv5kc
	 BYSV9xOI9uHDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tv95q63Rvz4x0t;
	Tue, 12 Mar 2024 21:35:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stefan Berger <stefanb@linux.ibm.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
In-Reply-To: <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
 <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
 <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
Date: Tue, 12 Mar 2024 21:35:43 +1100
Message-ID: <877ci74u0w.fsf@mail.lhotse>
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
Cc: peterhuewe@gmx.de, viparash@in.ibm.com, linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> On 3/7/24 15:00, Jarkko Sakkinen wrote:
>> On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
>>> in short summary: s/Use/use/
>>>
>>> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
>>>> If linux,sml-log is available use it to get the TPM log rather than the
>>>> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
>>>> on Power where after a kexec the memory pointed to by linux,sml-base may
>>>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
>>>> linux,sml-size on these two platforms.
>>>>
>>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>>
>>> So shouldn't this have a fixed tag, or not?
>> 
>> In English: do we want this to be backported to stable kernel releases or not?
>
> Ideally, yes. v3 will have 3 patches and all 3 of them will have to be 
> backported *together* and not applied otherwise if any one of them 
> fails. Can this be 'guaranteed'?

You can use Depends-on: <previous commit SHA> to indicate the relationship.

cheers
