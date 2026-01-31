Return-Path: <linuxppc-dev+bounces-16481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBZLONu+fWkATgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16481-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 09:35:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40AEC1463
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 09:35:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f35mj6F1Yz2xc2;
	Sat, 31 Jan 2026 19:35:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769845006;
	cv=none; b=DqeGWvix3KMH22cPF/s1bft+7IeMl37JJaChO+tAtq0eYq6x/mJAbxPD3TZDU9L7h7MkGrUNcq5iS1V5hQvG3fvU0W2oZQ2p9fO58OZio9C+DzIpT4SZul7ufqlPJKG0eS9mbYth1Iq6kFuOwhbI21nnwddTc07qGAr+FaH+X3C0Oxpl5hY4GmrV1qXbvgl27mcMpSQB6k0V1en+Bw7Xx3ofKpmPRRKVfmVltmRJpfpWTJJeEYti35jW5BN0MV5xzRKXtd2BXmKmYxdBNqpXAy0TAHmzuW1ikTVSthJ+Bvcq+KU3476zlCPPk4T6v4K5v6imK/6rEKIdlCxgeD2DyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769845006; c=relaxed/relaxed;
	bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLaIM015Sv1ZwkmzatPEnHJaIDh9ZMZXCTQn+SZ+SwfByixgqTCPpOCx+mkE3Wzp0Jqtou0l0Ch9P6MhPxViTKmSYnnUz2B7I8X5II4d+Qguy98t0ZLPeaxaWEgAW9TuOKfLFLxh39PPyRhf3vNnpZ+G0tCa2o+MFWxL/32NPgI0ue7aOvAxIwAJmXgYGN1PEd0eFcBzPD7oLTUxD8f4tkl5zHE0B7/obXqfRO6TvEY5hYytnAtUVLTLBYxPcd2Nb61UaWTcmjOBSBLUdJsZGIXdjBpNAWndtM+uEM7nFmjhYyg+AdfQz+zqkN31yRpAyZ34HvqNRvSXBC3IR3yOww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fSbkYAlT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mcaju95@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fSbkYAlT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mcaju95@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f34Ss13RSz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 18:36:44 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-480706554beso29983925e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 23:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769844996; x=1770449796; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=fSbkYAlTOVQKwpuiCh062TO4sSNQ+XlrFHmeNiVi5xaowvmeeR3NqkpH9Hn7z0vxd/
         wQsnhRFF7xrvCQWUcPyMiXeUQjii/rbILSs/xDw8Zkjci56M0+kMN5wmKgjrbqc1QC+q
         uKTzCWjxFI5c1cXCnEobb8stm5TsbUXS8fDB1jBEbPQOziWXKJOff3DgvUw3jXFvoccr
         ctbF1PeDOah/0lAIK0DYleLdAH7LkrD6OHNhrT/hocpFuRiRhBa9IVLLJ+TdC77fYyv5
         aSMPr5TSGPxv32s+tUgOvDg/fRCR5H5OqWgClqkXRq7IaexrAsJn5AVKr6mUL1C41pcz
         fsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844996; x=1770449796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5n1UjayTk0hO0b45clVXSkBxo9hRuWG9N3/vJ5awb1g=;
        b=n8Y5PwRTE7npn3XIWmuEncX0GVkWujmfSDsRXI30NW9D169UyBNGkMhuUyfTxJEsMP
         7jilLHiHN6pOzCbBmUVq7TAK1CIxFdVa6fEv+TAEWNvHteLgQlWkzEQGW4MsvjN0er9v
         SpFbO6CXUvop6dXLw9VxqHfN+QUauercLJ+xXbfo6hGtKQ91YYihFHkyg0dFFo41HnzA
         8Na9IT07kOkcaBwwLNGEvQtOfF/pV8RZgWOl0HcblCtKNcbOSTExiGSYH+adNPXTlyCm
         W0DQu01hr866M/jP1b6MN9jCpqjg1lCvuuoeWkp7xEXesRaVTbU2Fn4KyYYNjd3zuiPH
         DG/w==
X-Forwarded-Encrypted: i=1; AJvYcCWtiXOWwfJR/2vHr/hDHKEAA1kZf9nCCFKwLTpbZui/2EKKU2bOEHGmQ1fpT3KgP8LQGuW6i9yUzbLLOMM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywo9KiacfeIvQ3zEStQmUDuCWqWiFFKDlRv8zi1gF/NUSfpkaUD
	/7MrhS5cuQIafNbMdG3cBea14JYE0pkvIaEYakN3h9ODC3lS+MlbgO9P
X-Gm-Gg: AZuq6aKAN1OXg9vJegnnj0s7fMlXenkiOIQ0is8o0IRj3D54ZQSIK/+Whh3VIKgKTp3
	EtYdQxROD6i6NJYckdGyV9x8jMIXDohd91RtFzzXJ+VG+Xl/zsBoMmGOctZDB/ld5E70D9KsE4l
	iXuxp5y3QsZflc0C33KBolLh/AHWV/D8guxrNSSWMYIB10vQor9IhI5ubs8mxx07leMzSH+GXuQ
	4lTjKn+XwZ1txih97qwyAQnqleaJoebW8RHi5iiIW0ghwsBsdBZVWHrcNu5NWo9nWukBZrILFSO
	XI1A2bdWJBBmrxWDc/PqNCi5qUkJOYwUZ0Khu9sB77ae+Z7RiouiSoFQkhuZwQiD6idVVWkev1m
	q0PiBC1Ksmu3AlgqQbwJ6v97y1KcFaHL7Lj7O1CetrAUQ7Ph7wUb4uUbIfSmTRWQtcYEQmR7Yfb
	Vy
X-Received: by 2002:a05:600c:1e89:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-482db4ac0f4mr57301605e9.34.1769844995600;
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
Received: from legion.lan ([2a02:a58:9200:ea00::700])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cd8fadfsm248952145e9.0.2026.01.30.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:36:35 -0800 (PST)
From: =?UTF-8?q?Mihai-Drosi=20C=C3=A2ju?= <mcaju95@gmail.com>
To: linux@weissschuh.net
Cc: arnd@arndb.de,
	arnout@bzzt.net,
	atomlin@atomlin.com,
	bigeasy@linutronix.de,
	chleroy@kernel.org,
	christian@heusel.eu,
	corbet@lwn.net,
	coxu@redhat.com,
	da.gomez@kernel.org,
	da.gomez@samsung.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	f.gruenbichler@proxmox.com,
	jmorris@namei.org,
	kpcyrd@archlinux.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lkp@intel.com,
	maddy@linux.ibm.com,
	mattia@mapreri.org,
	mcaju95@gmail.com,
	mcgrof@kernel.org,
	mpe@ellerman.id.au,
	nathan@kernel.org,
	naveen@kernel.org,
	nicolas.bouchinet@oss.cyber.gouv.fr,
	nicolas.schier@linux.dev,
	npiggin@gmail.com,
	nsc@kernel.org,
	paul@paul-moore.com,
	petr.pavlu@suse.com,
	roberto.sassu@huawei.com,
	samitolvanen@google.com,
	serge@hallyn.com,
	xiujianfeng@huawei.com,
	zohar@linux.ibm.com
Subject: Re: [PATCH v4 00/17] module: Introduce hash-based integrity checking
Date: Sat, 31 Jan 2026 09:36:36 +0200
Message-ID: <20260131073636.65494-1-mcaju95@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16481-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:arnd@arndb.de,m:arnout@bzzt.net,m:atomlin@atomlin.com,m:bigeasy@linutronix.de,m:chleroy@kernel.org,m:christian@heusel.eu,m:corbet@lwn.net,m:coxu@redhat.com,m:da.gomez@kernel.org,m:da.gomez@samsung.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:f.gruenbichler@proxmox.com,m:jmorris@namei.org,m:kpcyrd@archlinux.org,m:linux-arch@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:lkp@intel.com,m:maddy@linux.ibm.com,m:mattia@mapreri.org,m:mcaju95@gmail.com,m:mcgrof@kernel.org,m:mpe@ellerman.id.au,m:nathan@kernel.org,m:naveen@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:nicolas.schier@linux.dev,m:npiggin@gmail.com,m:nsc@kernel.org,m:paul@paul-moore.com,m:petr.pavlu@suse.com,m:roberto.sassu@huawei.com,m:samitolvanen@google.com,m:se
 rge@hallyn.com,m:xiujianfeng@huawei.com,m:zohar@linux.ibm.com,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mcaju95@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[arndb.de,bzzt.net,atomlin.com,linutronix.de,kernel.org,heusel.eu,lwn.net,redhat.com,samsung.com,gmail.com,oracle.com,proxmox.com,namei.org,archlinux.org,vger.kernel.org,lists.ozlabs.org,intel.com,linux.ibm.com,mapreri.org,ellerman.id.au,oss.cyber.gouv.fr,linux.dev,paul-moore.com,suse.com,huawei.com,google.com,hallyn.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcaju95@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E40AEC1463
X-Rspamd-Action: no action

> The current signature-based module integrity checking has some drawbacks
in combination with reproducible builds. Either the module signing key
is generated at build time, which makes the build unreproducible, or a
static signing key is used, which precludes rebuilds by third parties
and makes the whole build and packaging process much more complicated.

I think there is a middle ground where the module signing key is generated
using a key derivation function that has as an input a deterministic value
on the build host, such as /etc/machine-id . The problem with this approach
is that only hosts knowing the value will be able to reproduce the build.

Maybe this is a solution to NixOS secret management? Introduce minimal
impurity as a cryptographic seed and derive the rest of the secrets using
something like Argon2(seed, key_uuid).

There might be another approach to code integrity rather than step-by-step
reproducibility. One may exploit the very cryptographic primitives that make
reproducibility hard to ensure that reproducibility is most  likely valid.

For example, the module signing issue, the build host publishes four artifacts:
* The source-code
* The compiled and signed binary
* The build environment
* Its public key

Now, we don't need to sign with the private key to know that building the source
code using the specific build environment and signing the result with the private
key will result in the claimed binary. We can just compile and verify with the
public key.

So a traditional workflow would be:
compiled_module + module_signature == module

In this case we build the module, sign it with whatever key, distribute the
builds and the private key to whoever wants to reproduce the build. Or we build
locally and the key stays with the end-user.

While the cryptographic approach would be:
verify(compiled_code, module.signature) is True

In this case we distribute the builds, source code and the public key. While
everyone can ensure that the compiled code is the result of the build
environment and source code. The signature is verified using cryptographic
means.

As long as no one cracks RSA or an algorithm of our choosing/has an absurd
amount of luck, the cryptographic approach would be just as good as the traditional
approach at ensuring that a program has stopped with a certain output.

