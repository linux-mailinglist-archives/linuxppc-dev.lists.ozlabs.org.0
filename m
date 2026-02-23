Return-Path: <linuxppc-dev+bounces-17076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OqpHZnEnGnJKAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17076-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 22:20:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DBB17D821
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 22:20:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKYfW5pZsz2xm3;
	Tue, 24 Feb 2026 08:20:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771881619;
	cv=none; b=eLWfDwaA5ia9G+Bhw0hJadvdE7aN0erE4C62wrrStpSq+FkP8upx0/o8K/xazVVtKpKo+LvSQGIakvt9/um3KbgWpSPK1jgkPH0CTDaZMC3/Bytpm0CoqdBHL0+oLCnYsA29uEQwLaOoQzo29AEA8v9y6sMy+PlRiw5x77evHnHS0UpOL688PFc+fOS8dFmhNa1PgcgyORci3uNnj7wNMuKJhTbHlzFW2xsH5XahONKgiBucckcNh53BTxr8fy2ONhAVejYim9Wd+iQdq5yfvTbHInGWIG4j4L3m8fo1TFJGECXjqRCDnc2aUw85ReIqKnf2zohI1PcBSkms/tLjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771881619; c=relaxed/relaxed;
	bh=RJf0nsljCI+i9g1LVWsmN8S0BjGbbwcRgx9+3Q3RHbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TnKmO/YZ9ZmURz8v+zspSFQjRZ71zUXyClw3XjDUE5zf+RhE4Gv1lfVFcK+gxKM/SbzSFyzNkmc7VZHdENwz27Gwvg7oMzVSVssRuzdzRYlzFwGJg29p6U32HVD0CZzQqS6W9shmUR5DFeqjfZsNYGfV1gou8F1G4Yd/958WPx2jUHytXsRYDOnFH+B4RTK2U1o4I+iorhwuIa1zqKqfIW9Lp7XRSCeKPMMkhQ6yZyWpnd4bUjLVckw29uwpkDQcixlOc4XXutykIHujyJGruUNSXteAdDyGHcW3iPZPou4X6tiz5FE+/4R6XXUwIj5sk5dV+ZOvM0coZOvke1JgIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SF0FAMRm; dkim-atps=neutral; spf=pass (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org) smtp.mailfrom=gmx.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=SF0FAMRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.21; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 354 seconds by postgrey-1.37 at boromir; Tue, 24 Feb 2026 08:20:16 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKYfS3xx5z2xlk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 08:20:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771881602; x=1772486402; i=deller@gmx.de;
	bh=RJf0nsljCI+i9g1LVWsmN8S0BjGbbwcRgx9+3Q3RHbw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SF0FAMRmkbGQrWavefAnUMWUc0OyKf7wx768XlklvOxV5eXjlGFJS3m1AxrhOMEf
	 YX7Gh0HyaxZczjfm0YbgqDplRtpNHexpgFnCqsNDjNhovOSVZBfQN0hcKjUD6SdVC
	 ppAdTBHg4UwVfeM5PT00IjmCJgmgb63igNhoABV92+FsxuUPKmXIUNn2yJdWK0ovt
	 3b4JPZOIwOt5xF9Vvt0JC0EyT3S6M//8Nj7NyIee+eCk6Fvb0P+qaRKt1LvlC8j9X
	 1v1bSXAYeJNZlZkcbegpjKAcpPzCiH5Yx8gv1AXnvK4e3MOLCF0qGIIwem0dtJyMj
	 frRivx/rAmXwhq5PMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.98]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mof9F-1vNpeT1l4D-00fO4G; Mon, 23
 Feb 2026 22:13:12 +0100
Message-ID: <fe6b9a16-232b-4819-b978-95775791c197@gmx.de>
Date: Mon, 23 Feb 2026 22:13:10 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
To: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <9ba5bb34-2356-4c10-a3d3-f122abe1073b@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <9ba5bb34-2356-4c10-a3d3-f122abe1073b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:edyU13fh/kMHHybT6GaqRMeq5qiPJzYGzoSP9IilU+H5UfLe2wQ
 oDiFn7ntb+Sc2C1oFkVuugZ3Yio0sM9opPmpbo5e/bfgfChIR2f38fiq3gyZQP4PwNxnp1A
 7RRRiLtZ/A9BTHEwih+bDa9/OBmP4fpdnVIX7px0BaxZqMOrjH/rG0WCmZItpSUUw938zf7
 Y/bYxXGufbN7sGvHlcpGw==
UI-OutboundReport: notjunk:1;M01:P0:eDXJPS6lBaw=;8LUXqkbLeInjyzXxl9AqxkbOxog
 cvZ+kDkkfgtSQ7bpUis5Fmat5STNxgQ+j1pfjToUhGTaWLNAEb+awqQ0PswjfSQbuFpsHwbvY
 BTJCB2OZcDzNXZiFZXrOHSrJ34pHe5pE1WOwE+5dZwBI7abipAkSEWh4r615cAW7if6JyuV1c
 HMChjPsMvh4GGHA4gOM1skZARSioPj172dVTmEFU5L8u2IoDZRt4WDzDQyVVGhCqvF9d8RqT7
 BHEnMdvVrNuuRiUFKMx8bS0fFCvAiEMlXskp3ahrKSnrH6Tt2OztJlwCKYgxSOYZ8HlxuYM0+
 +RWguOe5yNuU/7GQ6lEsHqr7/ZD3QM8awq0IwJi11mjLhOf/HywXfJoEI4W+6VF6J/2OOL+G8
 nRhqyFLoLc9hN6Ur33xJ99ekEycuwEE7iXK7WxUEZE44k6VEVFfntmlyAJNarZ/CqP8grUbiU
 5aeGSQo3WK0AGwKsOShP7WZqzmv2fbSc0JQXVCA1PLy+vYlnoUo+HSfLKk5zX7mwVnnEXBKGy
 blhJSecSQrcd+pPGyJoJX1vANRFRjwk7AAwKnTg52SklEuQB25TFpoTnyfhOeZvtlDeyN9n3Q
 rDvoPuVPRaDhCqiZfL38kB8B9p54ZGOgtNI9JkfWtYXE/V0RviF7IWw/wWLySPmpJZ5CNuSg5
 jZQZ0z8wB0BHUbmHWa3jVImqrf8Tf/NlJ9eydyZXIKpO89sakF2kRpeMLzFL71X6NvlaFsp6S
 zMCU2o7aA/atoC2WcTPh8yzLp4xMsC/TUq3hhyItvJbI/DO5YBdh5d0SUOyBeIQkPOe3HGO7W
 FfT5J5ZGwun0Wet98wyVwY2kSczLE+8ynS5PhA6xCWZ1wCcTYKoMkcST1n+hcuJRn2uyJhvF8
 V6yZpksA36zYvETnE/J7qLMWr2v8IEHGAKUtg18offCBEo2MI/ARswlM5GAFiV+KXJY8yGzVG
 GygFaBoF6pUucCFFU8WSwfBmEl1uKHD9AdUwnK3KdECUUop5nS8VnqHrOKYK+LWqv7UfRkYwE
 QUE2qZEF66Nv2KEI63M47xJOow9LX7Gko8HUvzCx8HRtBX1quH7HoHioZzboUS5CdTbo8o2+G
 +FgvbCCLLi3EcAuacvJKtNdBL/+Itig17IqpSah6C1PajjtDW3xkLDj87QNUu0sAuYzmPTZvM
 1QKJG364Ddv9gob+3fc3x2J23gvr5d10CQtqBcIt6ggX6t5d20GNKIpwZHA4p5ZM5DMo3GdDD
 iiYpiiFExm+CfBxICwk/XBZ94TT0K8mLSxTWAZBNNx4M70VB0mxKY3wAQ8ZRcDJ7lIPySDqdr
 vqsfqgDQYfMomd92nHvo55kryGOAmYHI+2oLdxiotE/pUrbaZolJUQGp+H14MgNae6mia/ulx
 NPcaJ73gbvCkzKsAyBOehhahdXTmqRosY4HFkn+lKoYUbB6b/1M6/Rd7talAsWik40jNZ1fvH
 /qwqCCfzdJmMIdqqNeCkFuncDr0orI3rbPWgJulhhox2LrWC5Mb9ygg9v4OmLmUn8+fYCZXK2
 OLn/Gn+f7Y2kajkXKoc3HwA/VVnl96OaMu7zT9iGjzne1GiEps795lv2BBupQykLxsOj3aqaD
 BBqnOD5Qhptm9N9u6BaimEMETMmXQd5Nhz0rzx+rMlXt8lJHbQhQpLYAOAWzjKyUulk0DHwSH
 y5aopYf5gSQvUKt1vDZ/QZg6DrucdqB55DI67QkmN37vRyGrkuAm0XIdxdmMiYfGmcpnkYzEb
 11CH2yxSvglq9WSbjSFGiqwzjnerdYwUGayJTWXyApwSMkLJSjy/lv52CnKUBGs5+Qnt+nSmH
 X9wkdAlnuiRW1Unl6Sz6qaIh445ploZq4gXyURGowsENA41raA3c/kWylpGxdlldWDuATmLEi
 g7JfVZ10S6DxYD6i8loZURGq7DevCpcLJKhOdMkSXeIPAbCmR2xDa1oTPW3PILpUNjOocAlab
 cLWCthBEMgl4n+ziSkYL44xa9ER/dEd6TyTPnkBNh//WbmOf5gCuHQyOD9lzPZvO3mjPj/pyc
 nxegcqk9DDYlqTPbQL3fPkIW8jOnOS2seYMmySKsenTXvvJVLsSYkRiqqKimJMLv5lp9fem1r
 mxZ+w3gIUtRQphZ0jqBgUl2zVU6EMMg93JaPsMbmCkcktJXsmwCL73FW2a0Egie0z/v1sFTsW
 LsopadaVZw7sBoKrT3xI0R99Fn/Q+hrPZrhHNQ4vALtKEkoy5Ad9AnxSGYYbtVWrqDknwcDNH
 ttRpYLT5DoTSuEWQik0xCAlaflaKrlb1JcuKqEuEXOnzYdyH57q7lEJmgElfu7i+VwnoJ5eCq
 Y7SPrJuzqnTFWekeg1efZKCEg+8nDu0DBnF9bYOPUl07vcfwSXZoTdFHq8fZKYpXf+jUsL23/
 wlmo2GPSSQ1PihXz4f5tp9e6JFT10GpiIcXxc7faFY1Fyn69SypD8DnO9H/795CjBQtWHBnwe
 bYCbUNQg8L4TSdimt8Vrm/Ibh6/P7o1CjRRJTgc8cHd/Dktck/1Yqumz9bWB7oLbi0DlMtCpw
 U/Gxek3JCHE9sbPe70fA2mDIGNIgq6aMfWKMlDqcpQ5gV6Me+jaxblfYplgX/de6M99nujlpe
 VJgHzqD9H/TMrbFEpkSJDP0mzuUmU8eBWCDk9yDAPbQDbhTkuvthCQIOv3GDay2VY14MZteAH
 a2eAOnPUA2o0uK2yfk2Td1tGJ+dUiRYg8mGbe1DmMBLbZo+dZhle7UEdoOigDGhgyJm8tUv+3
 20lUz0STH65e86v+dfg+I2Eg+YFtd+uN5aG9g2OgAbwYeRBoaOGWAGVZdXgkiN632a3prasgb
 UFyDumAW3vuVZZ9Sxo/HxBNY/jGJwAE2XgheFFqSwohzCcwYaEkTrEyAPKLIFGaTJXZ84oPc2
 seKevQ6nlN6nSnYZwgYNULBg+gl56mb6VdiRxzuFKIThQFuWDD0O3Ofq+LXvbsRRuCgH6+q0U
 7kAJjiER65dfvFPmNPmEPW7N+qY8JJAxK/bQqWmjLMxgk3H9pcYFP3t019d8AFIxRm4H8j8pX
 S2SCWq/YE9xVvFBpgKAo0E3/dcgkklVr+PiMU601X8vW8SU5ydhk23rKIQK2DD46SFpl4QVa1
 xGYolkcRj5ACmla6qFtNh2dj8pfe8G16t6l7Q+FmABr7mqe9b0eA9ibL/IP1kH/Q+RqxC3u1o
 McsF3fQJH4dKctofbORy2nCrsE/Cu3i05PsGjllWIQDS4df2U5LKdNkgomiRbkpEmFqCL6+hr
 mCCrqzxM1JXdGv7NVttUSfXVOA2xtWdlXwHoRyA13O19Nzc8ZUKJV0jhgzeQ7qVi+GDLZ5RRl
 aTuQSbv+snTnZ+JnOwK/wQUu/2Sj4nsHx59VT0mFbMX6RJK3/CVlNBB41xo1CsWNqv+1gOTYi
 lXjPooN1hOrjfyxOSZBImXEJsuKnoWJAKEDiG3UFejfHI3b/pDANvE/lq/0JdPjfoI74zQR4p
 32kp4yAecfyMeeU+CRIr//hcGbLEVaWcb7LxX9be8uXlGaF/kiFAH6a+fmJTpZFFW6eQDm8c9
 6VcDNagNQArjuRUQz/iV5xUQRdiPYggc0QHOi0vztoI92BPXdfRlyikf0wTcXRlyVAYzKcdHm
 r6CoxY1WrzgVcZh+QLvtlbaemYLSZxvP16ihy5m4BcP1nx7tBT47Xq5UB67Ny/pXYwu+0zKPx
 7iC0jnZj5qH8jbhF56RWIcifflzk5DDkFpXk7bcxS6+igzgOPIbI5OfuNzNKRDhQdmHyjyOjv
 kC2xSaVD+zhvyzYIU0nfj1WX+rVshi5crnkaoYPi6jSJ05AArRWQQfrUO6Bw3mUJtZoJ5P/ZJ
 BcUoNQDo/Z/EpLpTCRMufiRP5kRvSyFFhe6s5hyBpad0/gcSJDjOMsW5FZeJQUoRTP+UWp9AO
 2Emo6AI5KkeC6EXKna6Hcl2oh1PPVySxNIRQhmet2BcRNo8g/M2V0EixyVrknkpCJH9gG3cjM
 E9+OnMypDKhkK2dFKopatfoSuxdwt5ngEWpFZIme7tIwxR7yvtNn1iVJX3kkI1HN/1/AYjDNX
 6wSRkrIjRV/DpuHbSYTsGXhp7HVYfHvXU5zYd03KUg1xKxT+ap0MhgL6nBtXac8ck20dZXSFz
 XYhMZani2wIdE5hNEXXSA/aHxAOIyC0/nGxARfib4Bxh0UYvmd5hG2A5Q55nI4fTQKameMJqn
 2HGY3KXIts0eiXoudFzn3tQrCoysXDnxRdjuX7OJZcBA7+UVYrNfWEXiUpbavdspXPkllZ1Hh
 DxDPHwMtdH9LeXkAU8K68y8bd38YyjhgsT9yE5Vg9oC7mTM+R+qDtgbSNz/+o9KPEmM5atmiV
 NQv5iL6UVbtbCiAquOjdqCt+ir0YF5EOkWwYh5k/xYTEewaQUrWU5a65TXM1BAMpdlfCzu0yM
 NQ3w9xtSH26sPVx+WvTbZ6wbKYERN9pZovjsDKviEp6ll5wckfjzCvgxom27b4NL9sdN+hGRp
 oUtjNedGc4NL34sR33GQMBjz2eMtLwEjwMW52FeJ0keebUnaGDx825KlXhLtK2dnWHYpq5B0v
 KrlcBwxHuRBuZmOL9FcBxFAooULaMXnfas18OixxfVteDtx8onaQYQXddRlGCOU1OpJnBM+me
 o71J6b4YjchtkPBHUEt8LXnG/XYEu/MLX7wibnYadTbcrWeElkop3a5gHmecVsaYHyvwSZq80
 +P+w72iuVKppEIcyHqZVbXJa+aLFqIw4gguIQTjzoObE1JwuyimWXtYFVrpESHWqGmSbJqFPa
 G8VftC1fIVsjGk1McOhFsojOlsIpbsv1Ri4t8YGe5CO3P72s1iUDKA8tSTMJNyuc4fKcbjl/4
 TP9A1BxJx7rl1Wsjp3yh5BD1luw4xrd7/9hQOCD29C3NVbCK8Vw9fcujl1yn6QbKqHpvBMLT9
 ByUPbzR13NuPjTE+5zokoUE/hj2Psh+5VdBqnzYbz0ilpa0w0ILjS+6HmJQUsPTEorqrkgcup
 ldtTNwhXdeqznUUGYXB3gEiIrT7qgqqud9P7+5vcmgEHwqAEBZjbIoIRcu/4Q6CQ8rgQQf68O
 QVf//5+SCDovaS5OW2vQ79kPzlwDkk7y0tp4BDA8glgGQc5jm0XIZlY+aWm5V9rLOEJ1D+JAY
 ztzi1ZJssshYQvVJorNjcVEhfqJNksybt6Y3+hbbUaD7LClSM+YXiu6Ej5+AuJttMsT/R8zpk
 TjU2YPJNgfYod4oOa4gE2sXBW1Sym
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-17076-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[deller@gmx.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_RECIPIENTS(0.00)[m:ardb@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,arm.com,kernel.org,xen0n.name,hansenpartnership.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:mid,gmx.de:dkim,gmx.de:email]
X-Rspamd-Queue-Id: 64DBB17D821
X-Rspamd-Action: no action

On 2/23/26 20:38, Ard Biesheuvel wrote:
>=20
>=20
> On Mon, 23 Feb 2026, at 20:10, Nathan Chancellor wrote:
>> Hi all,
>>
>> The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
>> enable -fms-extensions") in 6.19 to gain access to a Microsoft
>> (originally Plan 9) extension around including a tagged structure/union
>> anonymously in an other structure/union. Since then, Clang 23.0.0
>> (current main) has added a flag to enable only that extension, rather
>> than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
>> narrower compiler option would have avoided the build error fixed by
>> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang'=
s
>> '-fms-extensions'"). While these errors are not expected to be common,
>> using the narrower option when available has no drawbacks because the
>> kernel only cares about this extension in '-fms-extensions', no others.
>> While this could result in build errors for folks using
>> '-fms-anonymous-structs' if a developer uses another extension in
>> '-fms-extensions' (either intentionally or unintentionally), flagging
>> these uses for further scrutiny seems worthwhile.
>>
>> This series converts the build system to use that flag when it is
>> available. The first patch consolidates all of the C dialect flags into
>> a single variable to make future updates to the dialect flags less
>> painful, as updating the logic in every place that uses their custom
>> built C flags is getting cumbersome (and C23 is looming). The second
>> patch makes the actual switch.
>>
>> I would like Nicolas to carry this in the Kbuild tree for 7.1, please
>> provide Acks as necessary.
>>
>> [1]:
>> https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692=
cc6b0ea902956
>>
>> ---
>> Nathan Chancellor (2):
>>        kbuild: Consolidate C dialect options
>>        kbuild: Use '-fms-anonymous-structs' if it is available
>>
>=20
> Acked-by: Ard Biesheuvel <ardb@kernel.org>

For the series:
Acked-by: Helge Deller <deller@gmx.de>  # parisc

Thanks!
Helge

