Return-Path: <linuxppc-dev+bounces-1676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C75C498903B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2024 18:08:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XGC1k0W64z2xs0;
	Sun, 29 Sep 2024 02:08:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727539721;
	cv=none; b=c7+VgMdBxqHj20OnemuhT/saUC9i9B5w1GptFtDp1PCfNVhQOpBa21+yqRopHXJByVjdFftTyD8Ypquaf/8AhJPgWDAuCoGR/tyAUcUP1xE5aoeGFYXgTHs5vv8cAxwOZqPeXwIQU+qFO90p5wfJrZQcWdWnnXtoDA0HyoE7AxFhVdcC7pgLUtxAkmjytcid5wEmgsmVySSMgHHjWMNUaFqqu+n4DrcfSNm/nQLy+8t1r4rCDAx2gblKOtYA9bok2GS4PUfA5Qr4ZIGMD+bkw5bBA+mm1KE4kNkDjksvV6M0eOhv2XCrb9HSsBoIhod8pEKFDiP97WxXd02Wl4HfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727539721; c=relaxed/relaxed;
	bh=BVhyGdzPo5lwXgUtI6R/o6Hb5c4Wd+LA4o4nC6SZqH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGuIZUvRyi+6pNh5FLWUth0scZ1ft0V8FJG/wCo/WlfakpUAZj6+NPbRBj7eR2783RBCugLQu2bQU1MmZ7QW/Es1xySwBCSfyZuICAQY1B11NA7xTdtvw7HOwdcmCWqbcBx5Y61KKSJC1Svb3dxrQBgzPSNSDRX/z68l9QXjOfA7wAnDE+JFw4VKDeMp/y/gqFUbjBtwFLjEPQdEtN+JmQ85BjS+ovmIVLivJLLL6M2JH6qD+hTmXkb1SXdaBVAuz7S+7uKIpMFpXxrz2FKKb7tPlhbqUSxt/ZOjXnN5YHxZbMTkK4ca79eDmJd1ksTwqBoD7hvdIP7yx8ym8OybBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeNf2Bbo; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeNf2Bbo; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeNf2Bbo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UeNf2Bbo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XGC1h1yv2z2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2024 02:08:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727539712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=BVhyGdzPo5lwXgUtI6R/o6Hb5c4Wd+LA4o4nC6SZqH4=;
	b=UeNf2Bbo+/Z/bOvtchQkM9nTZjMUlgpwANSCOLu5C+Hmq3x30PQpdPOLloDs0LnAd/V/bY
	jPvvDuCi/GreuC8gp4pOoarIH44GKwkGanC2Xlov42nQZ5qpiwxBQbn8fbAbUfvzYKaLod
	O5duKzjFUB28nPgTUA6VNvVKlZFEmFc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727539712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=BVhyGdzPo5lwXgUtI6R/o6Hb5c4Wd+LA4o4nC6SZqH4=;
	b=UeNf2Bbo+/Z/bOvtchQkM9nTZjMUlgpwANSCOLu5C+Hmq3x30PQpdPOLloDs0LnAd/V/bY
	jPvvDuCi/GreuC8gp4pOoarIH44GKwkGanC2Xlov42nQZ5qpiwxBQbn8fbAbUfvzYKaLod
	O5duKzjFUB28nPgTUA6VNvVKlZFEmFc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-NdxP2ncqPT6o1klT9XOD5g-1; Sat,
 28 Sep 2024 12:08:28 -0400
X-MC-Unique: NdxP2ncqPT6o1klT9XOD5g-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0575619780C8;
	Sat, 28 Sep 2024 16:08:28 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.45.224.151])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89B4A1979060;
	Sat, 28 Sep 2024 16:08:26 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Peter Bergner <bergner@linux.ibm.com>
Subject: Are 256K page sizes really a thing (on ppc64le in particular)?
Date: Sat, 28 Sep 2024 18:08:23 +0200
Message-ID: <87cyknzrpk.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on boromir.ozlabs.org

I'm working on adding a <sys/pagesize.h> header to glibc, so that
programmers can easily determine the range of possible page sizes for a
particular target, for things like pointer tagging and mapped file
alignment requirements.

I'm not familiar from the Kconfig system, but as far as I can tell, this
ensures that 256 KiB pages are only available on 44x machines:

arch/powerpc/Kconfig-config PPC_256K_PAGES
arch/powerpc/Kconfig-   bool "256k page size (Requires non-standard binutils settings)"
arch/powerpc/Kconfig-   depends on 44x && !PPC_47x
arch/powerpc/Kconfig:   select HAVE_PAGE_SIZE_256KB

And none of the 44x configurations set 64BIT, so it's all 32-bit.

Would it still make sense to recommend 256 KiB file alignment to
programmers on 32-bit PowerPC, or should <sys/pagesize.h> pretend
that the maximum page size is 64 KiB?

Thanks,
Florian


