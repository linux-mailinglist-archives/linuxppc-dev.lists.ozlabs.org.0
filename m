Return-Path: <linuxppc-dev+bounces-8080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6275BA9EB79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 11:07:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmHdj3mckz2yrV;
	Mon, 28 Apr 2025 19:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745826576;
	cv=none; b=OQrOWllGoZy2pUcSQ216und/ALmnFIBPyDWVi85dP9bdK0SZMAiHVHSwMFI+kixjUl45XbjmdAn2sAEAfBNJuDTxg2fmw1U+XHy0QMp27aduwpERhgBREQtVZvM7mUS+c9hemacP7CbdElBUnZlCMv1CyCtmpv+djleloHNOBcnddmcY9azLDJ0KjE5VyzVKvgH1BrMG17A8oeZ3uobebYxRj2cUNe8rNoy5k7+AK9Orldt/WXzY2MPucKQeQz/YfmuFXxCRkOqbQFTXLFXUIJR7XKqfwvlOyM8OI7DBGikqc1ECz3zFutQnd1bpVMG3BNNuueDodXdPy3T1k8xBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745826576; c=relaxed/relaxed;
	bh=ZHvvHhceHa8plRP4xtRJKiJR0MG9BOvLLfDUR5Tau4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEfBXpt0xNCU0exKVgGTw4NEgmG5k0Kuy6qej/8J7UVHZPq1229TxNuQxwmzLgBJ8ZLGll0E/CkFo7c321BKbdUdCm01O+B1lMu6hjI+1CZ8q2MRjzNB4SouXdXh6iBSn43NE4w6o9PZlmbrwuARxsKQyDxD05ldCv8kgKHV+kcFYJSfq+tcqDoI9bIu1Mc1SNA3WsFMxDkEeaVhmc4vHNcaMydtjdz2KHRjwqsQLGkpM1oPqHGLLJpFbQNRxkJzOxrk3HBsGoBxKP+6EUXsvC1B4VZHUSL0YcWaUFu4nYsuUv7CmhiGiy+pW6WvZZ3yPSqKTzs/Q8pvWcwrzyS4BA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uPximnop; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sumit.garg@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uPximnop;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sumit.garg@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmFvz4Jryz2yfy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 17:49:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3F1C5C5FAA;
	Mon, 28 Apr 2025 07:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BD6C4CEEC;
	Mon, 28 Apr 2025 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826572;
	bh=gz3v87ioQs5PO0ngRoziti1AQO3BGFw3wZSaC9CSs8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPximnopkAxrgRV655KCEfhvJ1fjCkHn8Cnxg5LGMEmrjp+Wb0hcUOj1p00wqeqUO
	 dzJlkTJF0OCpYhqD3T2sHusjTHmrV8HhuFPzeYoC9V6RUTrTkB/0j/UJBuE23ZJbIK
	 TWcyt2JNxEdwdo7bsUjYx8qw7JVCoLMq6jNtjD7NTLAdkRqg7c9ooybXK1uMDVJDlo
	 vfCdlKGblIlmWtEeht8ssisgKsw3pxrKias4RnPnfsZtslh2PmIMouwpR316bapMvJ
	 8JhEytjwyJYy+Vj9ezr4IpLOfyTyA3Y3d6rwFgAw1qPRi8CXbojTuvkhgv2nhhkGjH
	 iQMcp72gl2QeA==
Date: Mon, 28 Apr 2025 13:19:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <aA8zBP6h8oG5m4w9@sumit-X1>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-4-sgarzare@redhat.com>
 <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGxU2F5SJ9nQfAV-D1WKjsUow_01xjGBRXP4d+q4T=5Bw=yaOg@mail.gmail.com>
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Apr 14, 2025 at 04:59:47PM +0200, Stefano Garzarella wrote:
> On Mon, 14 Apr 2025 at 16:57, Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> >
> > So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
> > return responses in the same buffer used for commands. This way we
> > don't need the 4KB internal buffer used to cache the response before
> > .send() and .recv(). Also we don't need to implement recv() op.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v2:
> > - set TPM_CHIP_FLAG_SYNC and support it in the new send()
> > - removed Jens' T-b
> 
> @Jens @Sumit can you test/review this patch again since from v1 we
> changed the core a bit adding TPM_CHIP_FLAG_SYNC instead of
> send_recv() op?

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

