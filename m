Return-Path: <linuxppc-dev+bounces-4317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC769F647E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 12:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrfL5RYQz30T1;
	Wed, 18 Dec 2024 22:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734520442;
	cv=pass; b=hwIRNk6QAVJu278k2zLlgZrUMpbYGnlz5wkRdkrOnx2htG/o3QvVXG/kXhn5LSq7CaenfUgRcAuVFp84N+JBkB/EvlVhszl58hLNVQkIFwDJ/YdANw0G98wdWnQbi1EOz19+pfpNozScMJE7kQUOvXquciJv/RWTfuVFOkSU0qOYVvCobeweUezTW+2nt9G2p7obdtlYffZ3ErmtkMye7N1NkCZSe0jMhY4cXfqmGKG6PwotbbDYFLCkKvoQtTwKwwSxDTzIdjdtCBGfMHhggjMsHGA8ymOI2a08D40QvGOyTlfHmuaRYwJQcQXsikUR/+7/CLf7v4KkXJtg5uzRQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734520442; c=relaxed/relaxed;
	bh=d+A0TUVTVRvSdIuYqNlvwqtWoaWk5Z1w3FSESnThdXQ=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PgpexRwhLrPeMUt9SmyVAXNSwghFiMgPNIK9BnGx63STtCV1HhhQDaS35hZ3fdR7pVNYJNwns5NQqKe6UBK4T/Bu3PKGoHGsY8UVgYsAWSpHGu7xXbDMB/C+LU4mYzlbsFr3Pedkd1MCU66rAStOowREWeLB+mVH00e8cPwD70CdA1nSGEyCWC6WpY+MHdd5ohJw6r7z4d5DOmf0vk5UufzZJPUsLdUQMFtsF97xYGdUEqE2ar7Tds2fkuxfCGE3ltVzxQOpdJ6GOW1pzwtluH1XdKZI3NaCgzglT+q1gaUqvD8Se+fzBN6FvoWDP7LZn8raHZ4wyxTTdCWmvnSJ4Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ktRZONwT; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S1vCg1Vr; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ktRZONwT;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=S1vCg1Vr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 177 seconds by postgrey-1.37 at boromir; Wed, 18 Dec 2024 22:13:57 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrfF2ysBz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 22:13:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734520252; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cciW4fK35XVoC+9iL9xQva6odOLmx6NhplHbpyE2WRtH6iYcqAcLHO083N6cfFmLXu
    sdOi8G3bZySpyX6YMgVYuG3boNgXm6QCEeC7qap7fEWTRwUY4shexczNOtaGfXZ3EROJ
    FeBZf43wkNarJaFIU9WOC0bYUS8hBNHaXOPwaFAVjyfebJ/cxbqDUx7IYyejOh6F8DZc
    eKZ5OqFIVk5VUK+qvHN/AXFHPJ4PD7REKecokqRzyD2iKExhW1ow9VRtWGI51k9ltSUJ
    MLCQAfle/2+/C0gy4fijg5b4QENAaQkw8RiOI2IKBJR/7jXe6PcQ20hIX7SWAt+p5LRI
    qUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734520252;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=d+A0TUVTVRvSdIuYqNlvwqtWoaWk5Z1w3FSESnThdXQ=;
    b=WlpzBjDRNhjHTRMlqq4Ps7QutMw+7pypdG+Q2FYHnoQ9QjUfr9d/V6QwEBimBr7229
    8UqZIFOackLngUHM+oiK5hrHeTpB2WNr12XjN3yBZW96FfeP6hTxFShrymIB/AC0oJ5e
    dfNp059x63aOaF70tgtIhIXrkCq6kkTk7yJkzTvPxU94W/uSu7mtvbcIRND/CdsmzzCK
    F9aVXg0QXVlHz6FrxH9S5KfWS6mzzaoFQ9FHOSnQPb9hEIEK9j8l7esRgqkQz3I7u14i
    V/XLQGF87aNSDoQy2Ce2lIxXEl2mjHxL0x4uNgaB6+pbDAG6uO7ExJ2qWO0f62zuKRrY
    dQLg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734520252;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=d+A0TUVTVRvSdIuYqNlvwqtWoaWk5Z1w3FSESnThdXQ=;
    b=ktRZONwTML1+1MpEqsLyoBSiIhNgz4zSJ4IOMU1Dbdf0JfWgaD/Gpa194ao1ioVhTW
    56m0JYJd6dJUJObeQsOFMMTVqVYPQ85rKovq5uQRcooTyZ4yjte/ZempVSWX6HIXZ6ks
    nUF40dPygrxSiFL3qV1ZWecWZFki/ebQpeEtxyGyx79EsEWxqxgeBmzQqx2m1/KEYTLd
    roYsq93mbzWxxRCcBqNsGCnsm1UsaRa+fYX+a71UYcbOxUjlBhrEajYDUmbxNZpyaEYB
    vF4oOuA9i3baG8+iQRjS0sUE1UO9oR+v/HtB4X1a9VaEnpUiD1mV9qYd0VEfrY6DoxcT
    chfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734520252;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=d+A0TUVTVRvSdIuYqNlvwqtWoaWk5Z1w3FSESnThdXQ=;
    b=S1vCg1VryeWdQKxDfWxk5x9UInwNsQtfrl+ugOzcDxPEeoV0xt+Yhsc05jNxZSyM7G
    qwzCyqI687pKesvOEsDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.15 AUTH)
    with ESMTPSA id efffa60BIBAp6ef
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Dec 2024 12:10:51 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
Message-ID: <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
Date: Wed, 18 Dec 2024 12:10:51 +0100
X-Mailer: BrassMonkey/33.4.0
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
MIME-Version: 1.0
In-Reply-To: <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

The KVM HV host module doesn't work anymore since the PowerPC updates 
6.13-1 [1] and PowerPC MM updates [2].

We have tested it with our FSL P5020/P5040 boards [3].

The guest kernel doesn't boot. There is no output via the serial 
connection and no output via the graphics card. (QEMU)

It boots without the PowerPC updates 6.13-1 [1] and PowerPC MM updates [2].

Is the problem already known? Is there already a solution? I have seen 
many Book3S KVM HV updates. Have you perhaps forgotten Book3E?

Thanks,
Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42d9e8b7ccddee75989283cf7477305cfe3776ff
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d
[3] http://wiki.amiga.org/index.php?title=X5000

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


